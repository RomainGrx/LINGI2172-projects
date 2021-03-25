CREATE TABLE Train (
	num INT NOT NULL,
	type VARCHAR(255) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE Agent (
	empno INT NOT NULL,
	address VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (empno)
);

CREATE TABLE Station (
    name VARCHAR(255) NOT NULL,
    director INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (name),
    FOREIGN KEY(director) REFERENCES Agent(empno)
);

CREATE TABLE Travel (
    train INT NOT NULL,
    line VARCHAR(255) NOT NULL,
    driver INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    FOREIGN KEY (train) REFERENCES Train(num),
    FOREIGN KEY (line) REFERENCES Line(code) ON DELETE CASCADE,
    FOREIGN KEY (driver) REFERENCES Agent(empno),
    UNIQUE(train, line, driver, date, time) ON CONFLICT REPLACE
);

CREATE TABLE Line (
    code VARCHAR(255) NOT NULL,
    birthDate DATE NOT NULL,
    PRIMARY KEY (code)
);

CREATE TABLE Section (
    line VARCHAR(255) NOT NULL,
    start VARCHAR(255) NOT NULL,
    arrival VARCHAR(255) NOT NULL,
    orderNum VARCHAR(255) NOT NULL,
    length DECIMAL(7, 5) NOT NULL,
    FOREIGN KEY (line) REFERENCES Line(code) ON DELETE CASCADE,
    FOREIGN KEY (start) REFRENCES Station(name) ON DELETE CASCADE,
    FOREIGN KEY (arrival) REFRENCES Station(name) ON DELETE CASCADE,
    UNIQUE(line, start, arrival, orderNum) ON CONFLICT REPLACE
);
