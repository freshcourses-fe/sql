CREATE TABLE unique_workers(
  first_name varchar(64) NOT NULL,
  last_name varchar(64) NOT NULL,
  PRIMARY KEY(first_name,last_name),
  CONSTRAINT "ETO TEBE ZA DVOIKY PO ALGEBRE" CHECK (last_name != 'Vasilievich' AND first_name != 'Andrey')
);

INSERT INTO unique_workers
VALUES ('Anton', 'Antonov'),
('Anton', 'Petrov');
('Andrey', 'Vasilievich');

DROP TABLE unique_workers;