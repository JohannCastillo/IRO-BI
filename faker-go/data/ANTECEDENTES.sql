INSERT INTO TIPO_PACIENTE(TipoPaciente)
VALUES ('Interno'),
('Externo'),
('Referido'),
('Asegurado SIS')

-- TIPOS DE ANTECEDENTE: Heredofamiliares, no patológicos, patológicos, Hospitalización, Quirúrgicos, Traumáticos, Alérgicos, Inmunizaciones

INSERT INTO TIPO_ANTECEDENTE (Tipo)
VALUES ('Heredofamiliares'),
('No patológicos'),
('Patológicos'),
('Hospitalización'),
('Quirúrgicos'),
('Traumáticos'),
('Alérgicos'),
('Inmunizaciones')


-- Tipo 1: Heredofamiliares
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(1, 'Miopía hereditaria'),
(1, 'Retinopatía hereditaria'),
(1, 'Degeneración macular en la familia'),
(1, 'Cataratas'),
(1, 'Enfermedades oculares genéticas'),
(1, 'Estrabismo'),
(1, 'Glaucoma hereditaria'),
(1, 'Otras enfermedades oculares hereditarias'),
(1, 'Diabetes'),
(1, 'Hipertensión'),
(1, 'Cáncer hereditario'),
(1, 'Otras enfermedades cardiovasculares'),
(1, 'Alzheimer'),
(1, 'Enfermedades genéticas'),
(1, 'Otro')

-- Tipo 2: No patológicos
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(2, 'Exposición prolongada a pantallas'),
(2, 'Dieta basada en antioxidantes'),
(2, 'Ejercicios oculares'),
(2, 'Usa lágrimas artificiales'),
(2, 'Contacto con productos químicos irritantes para los ojos'),
(2, 'Dieta vegetariana'),
(2, 'Sedentarismo'),
(2, 'Consumo de alcohol'),
(2, 'Consumo de tabaco'),
(2, 'Fuma'),
(2, 'Exposición a humo de segunda mano'),
(2, 'Consumo de vitaminas y suplementos'),
(2, 'Uso de gafas de sol'),
(2, 'Uso de lentes de contacto'),
(2, 'Horas de sueño');

-- Tipo 3: Patológicos
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(3, 'Glaucoma'),
(3, 'Miopía'),
(3, 'Astigmatismo'),
(3, 'Cataratas'),
(3, 'Retinopatía diabética'),
(3, 'Degeneración macular relacionada con la edad (DMAE)'),
(3, 'Conjuntivitis crónica'),
(3, 'Ojo seco crónico'),
(3, 'Blefaritis crónica'),
(3, 'Uveítis'),
(3, 'Queratocono'),
(3, 'Estrabismo'),
(3, 'Ambliopía (ojo vago)'),
(3, 'Oclusión de la arteria retiniana'),
(3, 'Oclusión de la vena retiniana'),
(3, 'Conjuntivitis alérgica crónica'),
(3, 'Diabetes'),
(3, 'Hipotiroidismo'),
(3, 'Enfermedad de Crohn'),
(3, 'Lupus eritematoso sistémico'),
(3, 'Esclerosis múltiple'),
(3, 'Otro')


-- Tipo 4: Hospitalización
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES

(4, 'Hospitalización por lesión ocular'),
(4, 'Hospitalización por emergencia'),
(4, 'Otro')


-- Tipo 5: Quirúrgicos
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(5, 'Cirugía de cataratas'),
(5, 'Cirugía de glaucoma'),
(5, 'Cirugía de retina'),
(5, 'Cirugía refractiva LASIK'),
(5, 'Cirugía de párpados (blefaroplastia)'),
(5, 'Trasplante de córnea'),
(5, 'Cirugía de estrabismo'),
(5, 'Implantes intraoculares'),
(5, 'Vitrectomía'),
(5, 'Cirugía de desprendimiento de retina'),
(5, 'Tratamiento de queratocono'),
(5, 'Cirugía de corrección de párpado entropión/ectropión'),
(5, 'Cirugía de corrección de ptosis (párpado caído)'),
(5, 'Cirugía de corrección de pterigión'),
(5, 'Cirugía de corrección de ojo cruzado (estrabismo)')


-- Tipo 6: Traumáticos
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(6, 'Lesión ocular por accidente de tráfico'),
(6, 'Lesión ocular por caída o golpe'),
(6, 'Lesiones oculares deportivas'),
(6, 'Lesión ocular por objetos punzantes o cortantes'),
(6, 'Lesión ocular por productos químicos o salpicaduras'),
(6, 'Lesión ocular por radiación ultravioleta (UV)'),
(6, 'Lesión ocular por radiación láser'),
(6, 'Lesión ocular por incendio o explosión'),
(6, 'Lesión ocular por cuerpos extraños'),
(6, 'Lesión ocular por fuegos artificiales'),
(6, 'Lesión ocular por soldadura o chispas'),
(6, 'Lesión ocular por accidente laboral'),
(6, 'Lesión ocular por deportes de contacto'),
(6, 'Lesión ocular por proyectiles o impactos'),
(6, 'Lesión ocular por picaduras de insectos'),
(6, 'Otro')


-- Tipo 7: Alérgicos
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(7, 'Polen'),
(7, 'polvo'),
(7, 'Ácaros del polvo'),
(7, 'Pólenes locales'),
(7, 'Productos no irritantes para los ojos'),
(7, 'Colirios o soluciones oftálmicas'),
(7, 'Lentes de contacto o materiales de lentes'),
(7, 'Conservantes en gotas para los ojos'),
(7, 'Materiales de monturas de gafas'),
(7, 'Productos de maquillaje o productos para pestañas'),
(7, 'Látex'),
(7, 'Alimentos que pueden desencadenar alergias oculares'),
(7, 'Picaduras de insectos que pueden afectar los ojos'),
(7, 'Otro')


-- Tipo 8: Inmunizaciones
INSERT INTO ANTECEDENTE (IdTipoAntecedente, Antecedente)
VALUES
(8, 'Gripe (influenza)'),
(8, 'Tétanos'),
(8, 'Hepatitis A'),
(8, 'Hepatitis B'),
(8, 'Hepatitis C'),
(8, 'Sarampión, paperas y rubéola (MMR)'),
(8, 'Varicela'),
(8, 'COVID-19'),
(8, 'Fiebre amarilla'),
(8, 'Tuberculosis (BCG)'),
(8, 'Meningitis'),
(8, 'Polio'),
(8, 'Tos ferina (pertussis)'),
(8, 'VPH'),
(8, 'Fiebre tifoidea'),
(8, 'Neumonía (neumococo)')
