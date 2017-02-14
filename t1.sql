
CREATE TABLE "organisation" (
	"id_org" serial NOT NULL,
	"name" TEXT NOT NULL,
	"location" TEXT NOT NULL,
	"phone" TEXT NOT NULL,
	CONSTRAINT organisation_pk PRIMARY KEY ("id_org")
);

CREATE TABLE "branch_org" (
	"id_branch" serial NOT NULL,
	"name" TEXT NOT NULL,
	"location" TEXT NOT NULL,
	"phone" TEXT NOT NULL,
	"id_org" int NOT NULL,
	CONSTRAINT branch_org_pk PRIMARY KEY ("id_branch")
);

CREATE TABLE "employee" (
	"id_empl" serial NOT NULL,
	"full_name" TEXT NOT NULL,
	"position_work" TEXT NOT NULL,
	"organisation_id" int NOT NULL,
	"branch_id" int,
	"user_id" int NOT NULL,
	CONSTRAINT employee_pk PRIMARY KEY ("id_empl")
);

ALTER TABLE "branch_org" ADD CONSTRAINT "branch_org_fk0" FOREIGN KEY ("id_org") REFERENCES "organisation"("id_org");
ALTER TABLE "employee" ADD CONSTRAINT "employee_fk0" FOREIGN KEY ("organisation_id") REFERENCES "organisation"("id_org");


INSERT INTO organisation (name, location, phone) VALUES
 ('Елекард1', 'г.Томск, ул. Чернова, д. 1 ,оф. 1', '123-123'),
 ('Елекард2', 'г.Томск, ул. Иванова, д. 2 ,оф. 2', '234-234'),
 ('Елекард3', 'г.Томск, ул. Иванова, д. 3 ,оф. 3', '321-321');

INSERT INTO branch_org (name, location, phone, id_org) VALUES
 ('Елекард1.1', 'г.Томск, ул. Пушкина, д. 1 ,оф. 1', '123-123','1'),
 ('Елекард2.1', 'г.Киров, ул. Есенина, д. 2 ,оф. 2', '234-234','2'),
 ('Елекард3.1', 'г.Москва, ул. Бунина, д. 3 ,оф. 3', '321-321','3');


INSERT INTO employee (full_name, position_work, organisation_id, branch_id, user_id) VALUES
 ('Иванов Иван Иваныч', 'Техник', '1','0','321654'),
 ('Петров Петр Петрович', 'Сис.Админ','2','2','13'),
 ('Иванов Иван Иваныч', 'БомБом', '3','3','321654');


