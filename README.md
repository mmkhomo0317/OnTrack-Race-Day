RaceDay

A full-stack, cloud-aware web application for managing road running, walking, and cycling events in South Africa. Built progressively across three parts of the PROG6212 Portfolio of Evidence: system planning, a RESTful API, and an MVC web application with containerisation.

About the System

South Africa has a strong road-event culture (Comrades Marathon, Cape Town Cycle Tour, Soweto Marathon, and hundreds of community runs, walks, and cycles held weekly), but many of these events are still managed with paper registration and disconnected spreadsheets. RaceDay replaces that with a single platform where Event Organisers can create and manage events, categories, and results, while Participants can browse events, enrol, and track their personal race history.

Roles

RaceDay supports two distinct user roles:

Organiser – creates, edits, and deletes events; manages event categories; reviews participant enrolments and supporting documents; approves or rejects enrolments; captures finish times and finishing positions; and publishes race results.
Participant – registers an account, manages their profile and profile picture, browses and filters upcoming events, enrols in an event by selecting a category, uploads supporting documents where required, tracks the status of their enrolments, and views their personal race history and results.

RaceDay_ERD.png	Entity Relationship Diagram >>>

covering all 6 entities (User, Event, Category, Enrolment, SupportingDocument, Result), with primary keys, foreign keys, and cardinality for every relationship.

RaceDay_API_Endpoint_Plan.docx >>>

Full API endpoint plan covering Authentication, User Profile, Events, Categories, Event Enrolments, and Results — HTTP method, route, description, role required, request body, and expected response for every endpoint.

RaceDay_Database_Script.sql >>>

SQL Server script with CREATE TABLE statements for every entity (including primary keys, foreign keys, and constraints) plus seed data: 2 Organisers, 2 Participants, 3 Events, categories per event, and sample enrolments.
