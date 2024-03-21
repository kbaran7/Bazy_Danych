-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-03-21 13:22:20.106

-- tables
-- Table: Artykuly
CREATE TABLE Artykuly (
    IDZamowienia int  NOT NULL,
    IDPudelka char  NOT NULL,
    Sztuk int  NOT NULL,
    CONSTRAINT Artykuly_pk PRIMARY KEY (IDZamowienia,IDPudelka)
);

-- Table: Czekoladki
CREATE TABLE Czekoladki (
    IDCzekoladki int  NOT NULL,
    Nazwa char  NOT NULL,
    RodajCzekolady char  NOT NULL,
    RodzajOrzechow char  NOT NULL,
    RodzajNadzienia char  NOT NULL,
    Opis char  NOT NULL,
    Koszt money  NOT NULL,
    Masa int  NOT NULL,
    CONSTRAINT Czekoladki_pk PRIMARY KEY (IDCzekoladki)
);

-- Table: Klienci
CREATE TABLE Klienci (
    IDKlienta int  NOT NULL,
    Nazwa char  NOT NULL,
    Ulica char  NOT NULL,
    Miejscowosc char  NOT NULL,
    Kod char  NOT NULL,
    Telefon char  NOT NULL,
    Zamowienia_IDZamowienia int  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (IDKlienta)
);

-- Table: Pudelka
CREATE TABLE Pudelka (
    IDPudelka char  NOT NULL,
    Nazwa char  NOT NULL,
    Opis char  NOT NULL,
    Cena  money  NOT NULL,
    Stan int  NOT NULL,
    Artykuly_IDZamowienia int  NOT NULL,
    Artykuly_IDPudelka char  NOT NULL,
    Zawartosc_IDPudelka char  NOT NULL,
    Zawartosc_IDCzekoladki char  NOT NULL,
    CONSTRAINT Pudelka_pk PRIMARY KEY (IDPudelka)
);

-- Table: Zamowienia
CREATE TABLE Zamowienia (
    IDZamowienia int  NOT NULL,
    IDKlienta char  NOT NULL,
    DataRealizacji date  NOT NULL,
    Artykuly_IDZamowienia int  NOT NULL,
    Artykuly_IDPudelka char  NOT NULL,
    CONSTRAINT Zamowienia_pk PRIMARY KEY (IDZamowienia)
);

-- Table: Zawartosc
CREATE TABLE Zawartosc (
    IDPudelka char  NOT NULL,
    IDCzekoladki char  NOT NULL,
    Sztuk int  NOT NULL,
    Czekoladki_IDCzekoladki int  NOT NULL,
    CONSTRAINT Zawartosc_pk PRIMARY KEY (IDPudelka,IDCzekoladki)
);

-- foreign keys
-- Reference: Klienci_Zamowienia (table: Klienci)
ALTER TABLE Klienci ADD CONSTRAINT Klienci_Zamowienia
    FOREIGN KEY (Zamowienia_IDZamowienia)
    REFERENCES Zamowienia (IDZamowienia)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Pudelka_Artykuly (table: Pudelka)
ALTER TABLE Pudelka ADD CONSTRAINT Pudelka_Artykuly
    FOREIGN KEY (Artykuly_IDZamowienia, Artykuly_IDPudelka)
    REFERENCES Artykuly (IDZamowienia, IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Pudelka_Zawartosc (table: Pudelka)
ALTER TABLE Pudelka ADD CONSTRAINT Pudelka_Zawartosc
    FOREIGN KEY (Zawartosc_IDPudelka, Zawartosc_IDCzekoladki)
    REFERENCES Zawartosc (IDPudelka, IDCzekoladki)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zamowienia_Artykuly (table: Zamowienia)
ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Artykuly
    FOREIGN KEY (Artykuly_IDZamowienia, Artykuly_IDPudelka)
    REFERENCES Artykuly (IDZamowienia, IDPudelka)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Zawartosc_Czekoladki (table: Zawartosc)
ALTER TABLE Zawartosc ADD CONSTRAINT Zawartosc_Czekoladki
    FOREIGN KEY (Czekoladki_IDCzekoladki)
    REFERENCES Czekoladki (IDCzekoladki)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

