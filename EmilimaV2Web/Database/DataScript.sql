USE [emilima]
GO

DELETE FROM [emilima].[user_role]
GO
DELETE FROM [emilima].[request_state]
GO
DELETE FROM [emilima].[file]
GO
DELETE FROM [emilima].[hierarchical_dependency]
GO
DELETE FROM [emilima].[document_type]
GO
DELETE FROM [emilima].[organic_unit]
GO
DELETE FROM [emilima].[document]
GO

INSERT INTO [emilima].[user_role]([name], [description]) VALUES ('Administrador', 'Usuario con permisos globales.')
GO
INSERT INTO [emilima].[user_role]([name], [description]) VALUES ('Unidad org�nica', 'Usuario con capacidad de registrar solicitudes de documentaci�n.')
GO
INSERT INTO [emilima].[user_role]([name], [description]) VALUES ('T�cnico', 'Usuario con capacidad de administrar solicitudes y documentos.')
GO
INSERT INTO [emilima].[user_role]([name], [description]) VALUES ('Secretario general', 'Usuario con capacidad de autorizar solicitudes y administrar las entidades.')
GO

INSERT INTO [emilima].[request_state]([name]) VALUES ('PENDIENTE')
GO
INSERT INTO [emilima].[request_state]([name]) VALUES ('VALIDADA')
GO
INSERT INTO [emilima].[request_state]([name]) VALUES ('AUTORIZADA')
GO
INSERT INTO [emilima].[request_state]([name]) VALUES ('ATENDIDA')
GO

INSERT INTO [emilima].[file]([id], [filename]) VALUES ('dca3a58c-ef10-11ec-8ea0-0242ac120002', 'ejemplo.pdf')
GO
INSERT INTO [emilima].[file]([id], [filename]) VALUES ('e2d96144-ef10-11ec-8ea0-0242ac120002', 'ejemplo.pdf')
GO
INSERT INTO [emilima].[file]([id], [filename]) VALUES ('eb535816-ef10-11ec-8ea0-0242ac120002', 'ejemplo.pdf')
GO
INSERT INTO [emilima].[file]([id], [filename]) VALUES ('f0783f8c-ef10-11ec-8ea0-0242ac120002', 'ejemplo.pdf')
GO
INSERT INTO [emilima].[file]([id], [filename]) VALUES ('c4042c2a-f106-11ec-8ea0-0242ac120002', 'user-photo-default.png')
GO

INSERT INTO [emilima].[hierarchical_dependency]([name]) VALUES ('DIRECTORIO')
GO
INSERT INTO [emilima].[hierarchical_dependency]([name]) VALUES ('GERENCIA GENERAL')
GO
INSERT INTO [emilima].[hierarchical_dependency]([name]) VALUES ('�RGANO DE CONTROL INSTITUCIONAL')
GO
INSERT INTO [emilima].[hierarchical_dependency]([name]) VALUES ('GERENCIA DE ASUNTOS LEGALES')
GO
INSERT INTO [emilima].[hierarchical_dependency]([name]) VALUES ('GERENCIA DE ATENCI�N AL CIUDADANO, COMUNICACIONES Y TECNOLOG�A DE LA INFORMACI�N')
GO
INSERT INTO [emilima].[hierarchical_dependency]([name]) VALUES ('GERENCIA DE ADMINISTRACI�N Y FINANZAS')
GO

INSERT INTO [emilima].[document_type]([name]) VALUES ('Resoluci�n')
GO
INSERT INTO [emilima].[document_type]([name]) VALUES ('Acta')
GO
INSERT INTO [emilima].[document_type]([name]) VALUES ('Memorando')
GO
INSERT INTO [emilima].[document_type]([name]) VALUES ('Informe')
GO
INSERT INTO [emilima].[document_type]([name]) VALUES ('Plan de Trabajo')
GO
INSERT INTO [emilima].[document_type]([name]) VALUES ('Directiva')
GO

INSERT INTO [emilima].[organic_unit]([name]) VALUES ('GERENCIA GENERAL')
GO
INSERT INTO [emilima].[organic_unit]([name]) VALUES ('�RGANO DE CONTROL INSTITUCIONAL')
GO
INSERT INTO [emilima].[organic_unit]([name]) VALUES ('GERENCIA DE ASUNTOS LEGALES')
GO
INSERT INTO [emilima].[organic_unit]([name]) VALUES ('GERENCIA DE PLANIFICACI�N, PRESUPUESTO Y MODERNIZACI�N')
GO
INSERT INTO [emilima].[organic_unit]([name]) VALUES ('GERENCIA DE ATENCI�N AL CIUDADANO, COMUNICACIONES Y TECNOLOG�A DE LA INFORMACI�N')
GO
INSERT INTO [emilima].[organic_unit]([name]) VALUES ('GERENCIA DE ADMINISTRACI�N Y FINANZAS')
GO

INSERT INTO [emilima].[user_position]([name], [organic_unit_id], [hierarchical_dependency_id]) VALUES ('GERENTE GENERAL', 1, 1)
GO
INSERT INTO [emilima].[user_position]([name], [organic_unit_id], [hierarchical_dependency_id]) VALUES ('GERENTE DE �RGANO DE CONTROL INSTITUCIONAL', 1, 1)
GO
INSERT INTO [emilima].[user_position]([name], [organic_unit_id], [hierarchical_dependency_id]) VALUES ('GERENTE DE ASUNTOS LEGALES', 1, 1)
GO
INSERT INTO [emilima].[user_position]([name], [organic_unit_id], [hierarchical_dependency_id]) VALUES ('GERENTE DE PLANIFICACI�N, PRESUPUESTO Y MODERNIZACI�N', 1, 1)
GO
INSERT INTO [emilima].[user_position]([name], [organic_unit_id], [hierarchical_dependency_id]) VALUES ('GERENTE DE ATENCI�N AL CIUDADANO, COMUNICACIONES Y TECNOLOG�A DE LA INFORMACI�N', 1, 1)
GO
INSERT INTO [emilima].[user_position]([name], [organic_unit_id], [hierarchical_dependency_id]) VALUES ('GERENTE DE ADMINISTRACI�N Y FINANZAS', 1, 1)
GO

SELECT * FROM [emilima].[user_role]
GO

INSERT INTO [emilima].[user]([username], [password], [email], [role_id], [position_id]) VALUES ('admin', 'admin', 'admin@emilima.com.pe', 1, 1)
GO
INSERT INTO [emilima].[user]([username], [password], [email], [role_id], [position_id]) VALUES ('admin1', 'admin', 'admin@emilima.com.pe', 1, 1)
GO
INSERT INTO [emilima].[user]([username], [password], [email], [role_id], [position_id]) VALUES ('user', 'admin', 'admin@emilima.com.pe', 1, 1)
GO

INSERT INTO [emilima].[documental_serie]([code], [name], [hierarchical_dependency_id], [organic_unit_id], [definition], [service_frequency], [normative_scope], [is_public], [phisical_features], [documental_serie_value], [years_in_management_archive], [years_in_central_archive], [elaboration_date]) VALUES ('SERIE1', 'Serie documental 1', 1, 1, 'Serie documental de ejemplo', 'Cada 1 d�a', 'A', 1, 'En buen estado', 1, 2, 2, '2016-12-21 00:00:00.0000000');
GO
INSERT INTO [emilima].[documental_serie]([code], [name], [hierarchical_dependency_id], [organic_unit_id], [definition], [service_frequency], [normative_scope], [is_public], [phisical_features], [documental_serie_value], [years_in_management_archive], [years_in_central_archive], [elaboration_date]) VALUES ('SERIE2', 'Serie documental 2', 1, 1, 'Serie documental de ejemplo', 'Cada 1 d�a', 'B', 1, 'En buen estado', 1, 2, 2, '2016-12-21 00:00:00.0000000');
GO

INSERT INTO [emilima].[document]([name], [description], [upload_date], [creation_date], [file_id], [document_type_id], [document_serie_id], [document_request_id]) VALUES ('Documento1', 'El presente documento es una certificaci�n', '2016-12-21 00:00:00.0000000', '2016-12-21 00:00:00.0000000', 'e2d96144-ef10-11ec-8ea0-0242ac120002', 1, 'SERIE1', 1);
GO
INSERT INTO [emilima].[document]([name], [description], [upload_date], [creation_date], [file_id], [document_type_id], [document_serie_id], [document_request_id]) VALUES ('Documento2', 'El presente documento es una certificaci�n', '2016-12-21 00:00:00.0000000', '2016-12-21 00:00:00.0000000', 'e2d96144-ef10-11ec-8ea0-0242ac120002', 1, 'SERIE2', 1);
GO

SELECT * FROM [emilima].[user_role]
GO
SELECT * FROM [emilima].[request_state]
GO
SELECT * FROM [emilima].[file]
GO
SELECT * FROM [emilima].[hierarchical_dependency]
GO
SELECT * FROM [emilima].[document_type]
GO
SELECT * FROM [emilima].[organic_unit]
GO
SELECT * FROM [emilima].[document]
GO