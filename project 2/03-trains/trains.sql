CREATE TABLE Train (
	num INT,
	type VARCHAR(255),
	PRIMARY KEY (num)
);


CREATE TABLE Agent (
	empno INT,
	address VARCHAR(255),
	name VARCHAR(255),
	PRIMARY KEY (empno)
);

CREATE TABLE Station (
    name VARCHAR(255),
    director INT,
    location VARCHAR(255),
    PRIMARY KEY (name),
    FOREIGN KEY(director) REFERENCES Agent(empno)
);

CREATE TABLE Travel (
    train INT,
    line VARCHAR(255),
    driver INT,
    date DATE,
    time TIME,
    FOREIGN KEY (train) REFERENCES Train(num),
    FOREIGN KEY (line) REFERENCES Line(code) ON DELETE CASCADE,
    FOREIGN KEY (driver) REFERENCES Agent(empno),
    UNIQUE(train, line, driver, date, time) ON CONFLICT REPLACE
);

CREATE TABLE Line (
    code VARCHAR(255),
    birthDate DATE,
    PRIMARY KEY (code)
);

CREATE TABLE Section (
    line VARCHAR(255),
    start VARCHAR(255),
    arrival VARCHAR(255),
    orderNum VARCHAR(255),
    length DECIMAL(7, 5),
    FOREIGN KEY (line) REFERENCES Line(code) ON DELETE CASCADE,
    FOREIGN KEY (start) REFRENCES Station(name) ON DELETE CASCADE,
    FOREIGN KEY (arrival) REFRENCES Station(name) ON DELETE CASCADE,
    UNIQUE(line, start, arrival, orderNum) ON CONFLICT REPLACE
);
