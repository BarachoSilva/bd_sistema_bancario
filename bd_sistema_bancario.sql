CREATE TABLE Clientes (
    IDCliente SERIAL PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(100),
    2 SaldoConta DECIMAL(10, 2)
);

CREATE TABLE Transacoes (
    IDTransacao SERIAL PRIMARY KEY,
    IDCliente INT,
    Valor DECIMAL(10, 2),
    TipoOperacao VARCHAR(10),
    DataTransacao DATE,
    FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

CREATE
OR REPLACE FUNCTION AtualizarSaldo() RETURNS TRIGGER AS $ $ BEGIN
UPDATE
    Clientes
SET
    SaldoConta = SaldoConta + NEW.Valor
WHERE
    IDCliente = NEW.IDCliente;

RETURN NEW;

END;

$ $ LANGUAGE plpgsql;

CREATE TRIGGER TriggerAtualizarSaldo
AFTER
INSERT
    ON Transacoes FOR EACH ROW EXECUTE FUNCTION AtualizarSaldo();