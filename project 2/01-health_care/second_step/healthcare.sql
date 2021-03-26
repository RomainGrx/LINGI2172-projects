CREATE TABLE person(
    person_id INTEGER PRIMARY KEY NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    bday DATETIME NOT NULL, 
    adress VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(30) NOT NULL UNIQUE, 
    at_risk BOOLEAN NOT NULL CHECK (at_risk IN (0, 1))
);

CREATE TABLE visit(
    person_id INTEGER NOT NULL, 
    name VARCHAR(30) NOT NULL,
    visit_timestamp_start TIMESTAMP NOT NULL,
    visit_timestamp_end TIMESTAMP NOT NULL,
    PRIMARY KEY (person_id, name, visit_timestamp_start, visit_timestamp_end)
    FOREIGN KEY(person_id) REFERENCES people(person_id) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES place(name) ON DELETE CASCADE
);

CREATE TABLE place(
    name VARCHAR(30) PRIMARY KEY NOT NULL, 
    adress VARCHAR(50) NOT NULL,
    type VARCHAR(15) NOT NULL,
    capacity INTEGER NOT NULL
);

CREATE TABLE practioner(
    practioner_id INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY(practioner_id) REFERENCES person(person_id) ON DELETE CASCADE
);

CREATE TABLE patient(
    patient_id INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES person(person_id) ON DELETE CASCADE
);

CREATE TABLE call_centerist(
    call_centerist_id INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY(call_centerist_id) REFERENCES person(person_id) ON DELETE CASCADE
);

CREATE TABLE call( 
    duration INTEGER NOT NULL,
    reason VARCHAR(100) NOT NULL, 
    timestamp_call TIMESTAMP NOT NULL,
    patient_id INTEGER NOT NULL,
    call_centerist_id INTEGER NOT NULL,
    PRIMARY KEY (timestamp_call, patient_id, call_centerist_id),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY(call_centerist_id) REFERENCES call_centerist(call_centerist_id) ON DELETE CASCADE
);
CREATE TABLE test(
    timestamp_test TIMESTAMP NOT NULL, 
    test_result VARCHAR(60) NOT NULL,
    practioner_id INTEGER NOT NULL,
    patient_id INTEGER NOT NULL,
    PRIMARY KEY(timestamp_test, practioner_id, patient_id),
    FOREIGN KEY(practioner_id) REFERENCES practioner(practioner_id) ON DELETE CASCADE,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE
);  

CREATE TABLE disease(
    name VARCHAR(30) PRIMARY KEY NOT NULL,
    effects VARCHAR(70) NOT NULL,
    test_id INTEGER NOT NULL,
    FOREIGN KEY(test_id) REFERENCES test(test_id) ON DELETE CASCADE
);
