CREATE TABLE zorzalUser(
    privateKey PRIMARY Key int not null,
    firstName VARCHAR(20) not null,
    lastName VARCHAR(20) not NULL,
    email VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL
);

CREATE TABLE exchange(
    exchangeId serial PRIMARY KEY,
    senderPrivateKey int not null REFERENCES zorzalUser(privateKey),
    recieverPrivateKey int not null REFERENCES zorzalUser(privateKey),
    amountPaid real not null,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    isDollar boolean not null
)

CREATE TABLE historical(
    date TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP PRIMARY KEY,
    dollarRate real not null,
    clpRate real not null
)

CREATE TABLE transaction(
    transactionId serial PRIMARY KEY,
    senderPrivateKey int not null REFERENCES zorzalUser(privateKey),
    recieverPrivateKey int NOT NULL REFERENCES zorzalUser(privateKey),
    zorzalesQuantity real not null,
    date timestamp default current_timestamp
)