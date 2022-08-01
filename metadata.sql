BEGIN;

SET client_encoding = 'LATIN1';

CREATE TABLE languages (
    language_id char(2) NOT NULL,
    name text
);

CREATE TABLE questionnaires (
    questionnaire_id char(8) NOT NULL,
    creation_date date NOT NULL,
    respondent text NOT NULL,
    language_id char(2)
);

CREATE TABLE questions (
    question_id char(8) UNIQUE NOT NULL,
    question_EN text UNIQUE NOT NULL,
    questionnaire_id char(8)
);

CREATE TABLE questions_variables (
    question_id char(8),
    variable_id char(8),
    PRIMARY KEY (question_id, variable_id)
);

CREATE TABLE translations (
    translation_id char(8) NOT NULL,
    question text,
    question_id char(8),
    language_id char(8)
);

CREATE TABLE concepts_variables (
    concept_id char(8),
    variable_id char(8),
    PRIMARY KEY (concept_id, variable_id)
);

CREATE TABLE concepts (
    concept_id char(8) UNIQUE NOT NULL,
    name text NOT NULL,
    parent_id char(8),
    type char(8)
);

CREATE TABLE stscategories (
    category_id char(8) UNIQUE NOT NULL,
    name text NOT NULL,
    parent_id char(8)
);

CREATE TABLE stscategories_variables (
    category_id char(8),
    variable_id char(8),
    PRIMARY KEY (category_id, variable_id)
);

CREATE TABLE variables (
    variable_id char(8) UNIQUE NOT NULL,
    name text NOT NULL,
    creation_date date NOT NULL,
    measure_level text,
    data_type text,
    measure_unit text,
    direct boolean,
    formula text,
    answer_number int
);

COPY languages (language_id, name) FROM stdin;
EN	English
IT	Italian
\.

COPY concepts (concept_id, name, parent_id, type) FROM stdin;
00000001	Cognition and Behaviour	null	cobrad
00000002	Memory	00000001	cobrad
00000003	Short-term memory	00000002	cobrad
00000004	Long-term memory	00000002	cobrad
00000005	Visual memory	00000002	cobrad
00000006	Verbal memory	00000002	cobrad
00000007	Executive	00000001	cobrad
00000008	Processing speed	00000007	cobrad
00000009	Attention and alertness	00000007	cobrad
00000010	Working memory	00000007	cobrad
00000011	Planning and organisation	00000007	cobrad
00000012	Judgment and Complex Problem Solving	00000007	cobrad
00000013	Cognitive Inhibition	00000007	cobrad
00000014	Error monitoring	00000007	cobrad
00000015	Set Shifting	00000007	cobrad
00000016	Language and Speech	00000001	cobrad
00000017	Naming	00000016	cobrad
00000018	Semantic comprehension	00000016	cobrad
00000019	Praxis of speech/integrity of motor component of speech	00000016	cobrad
00000020	Grammar	00000016	cobrad
00000021	Prosody	00000016	cobrad
00000022	Intensity(vs. hypophonia)	00000016	cobrad
00000023	Visual/Sensory Perceptual	00000001	cobrad
00000024	Navigation	00000023	cobrad
00000025	Object Perception	00000023	cobrad
00000026	Movement Perception	00000023	cobrad
00000027	Auditory processing	00000023	cobrad
00000028	Mood	00000001	cobrad
00000029	Anxiety	00000028	cobrad
00000030	Sadness	00000028	cobrad
00000031	Behaviour and Social Cognition	00000001	cobrad
00000032	Social inhibition	00000031	cobrad
00000033	Empathy	00000031	cobrad
00000034	Motivation(vs. Apathy)	00000031	cobrad
00000035	Mental fluidity(vs. Rigidity and Perseveration)	00000031	cobrad
00000036	Dietary habits(vs. Hyperorality)	00000031	cobrad
00000037	Motor	null	cobrad
00000038	Extrapyramidal	00000037	cobrad
00000039	Bradykinesia and Freezing	00000038	cobrad
00000040	Rigidity	00000038	cobrad
00000041	Tremor	00000038	cobrad
00000042	Postural instability	00000038	cobrad
00000043	Dystonia	00000038	cobrad
00000044	Myoclonus	00000038	cobrad
00000045	Chorea	00000038	cobrad
00000046	Pyramidal	00000037	cobrad
00000047	Limb-kinetic praxis	00000046	cobrad
00000048	UMN	00000046	cobrad
00000049	LMN	00000046	cobrad
00000050	Coordination	00000037	cobrad
00000051	Planning apraxia	00000050	cobrad
00000052	Chorea	00000050	cobrad
00000053	Cerebellar ataxia	00000050	cobrad
00000054	Myoclonus	00000050	cobrad
00000055	Tardive dyskinesia	00000050	cobrad
00000056	Perceptual	00000037	cobrad
00000057	Sensory ataxia	00000056	cobrad
00000058	Autonomic-Sensory-Perceptual	null	cobrad
00000059	Temperature	00000058	cobrad
00000060	Cardiovascular	00000058	cobrad
00000061	Gastrointestinal	00000058	cobrad
00000062	Olfaction	00000058	cobrad
00000063	Audition	00000058	cobrad
00000064	Vision	00000058	cobrad
00000065	Somesthesia	00000058	cobrad
00000066	Taste	00000058	cobrad
00000067	Proprioception	00000058	cobrad
00000068	Sleep	null	cobrad
00000069	Sleep Disordered Breathing	00000068	cobrad
00000070	Insomnia	00000068	cobrad
00000071	Sleep Onset	00000070	cobrad
00000072	Sleep Maintenance	00000070	cobrad
00000073	Early awakening	00000070	cobrad
00000074	Hypersomnia and Hypersomnolence	00000068	cobrad
00000075	Excessive Daytime Somnolence	00000074	cobrad
00000076	Excessive sleep time	00000074	cobrad
00000077	Sleep-wake Rhytms	00000068	cobrad
00000078	Infradian	00000077	cobrad
00000079	Circadian	00000077	cobrad
00000080	Ultradian	00000077	cobrad
00000081	Sleep-related movements	00000068	cobrad
00000082	Limb movements prior to sleep	00000081	cobrad
00000083	Parasomnia and Dissociated State	00000068	cobrad
00000084	NREM parasomnia	00000083	cobrad
00000085	REM parasomnia	00000083	cobrad
00000086	REM-wake dissociation	00000083	cobrad
00000087	NREM-wake dissociation	00000083	cobrad
00000088	Epilepsy and Seizure Disorders	null	cobrad
00000089	Premonitory aura symptoms	00000088	cobrad
00000090	Character/Type	00000089	cobrad
00000091	Seizure	00000088	cobrad
00000092	Phenotype	00000091	cobrad
00000093	Focal vs Generalised	00000092	cobrad
00000094	Motor vs Perceptual vs Autonomic	00000092	cobrad
00000095	Level of Alertness	00000092	cobrad
00000096	Triggers	00000091	cobrad
00000097	Post-ictal	00000088	cobrad
00000098	Injuries	00000097	cobrad
00000099	Cognitive/Behavioural deficits	00000097	cobrad
00000100	Praxis deficits	00000097	cobrad
00000101	Perceptual deficits	00000097	cobrad
00000102	Autonomic and Urinary deficits	00000097	cobrad
00000103	CC and HPI	null	hp
00000104	ROS	null	hp
00000105	FS/ADLs/IADLs	null	hp
00000106	Driving	00000105	hp
00000107	Cooking	00000105	hp
00000108	Excercise and Diet	00000105	hp
00000109	Financial management	00000105	hp
00000110	Self-care	00000105	hp
00000111	PMH and Development	null	hp
00000112	ICD-x/DSM-y codes	00000111	hp
00000113	Review of high-yield medical history	00000111	hp
00000114	Review of diagnoses based on current and past medications	00000111	hp
00000115	SH	null	hp
00000116	Location of birth and growing up	00000115	hp
00000117	Living and relationship status	00000115	hp
00000118	Religion	00000115	hp
00000119	Education	00000115	hp
00000120	School/employment history and status	00000115	hp
00000121	Financial	00000115	hp
00000122	Healthcare System and Utilisation	00000115	hp
00000123	FH	null	hp
00000124	Ancestry	00000123	hp
00000125	Family Social Background	00000123	hp
00000126	Family PMH	00000123	hp
00000127	Review of high-yield medical history(e.g. CoBraD)	00000123	hp
00000128	Medications	null	hp
00000129	Current	00000128	hp
00000130	Prescribed	00000129	hp
00000131	Day-to-day use	00000129	hp
00000132	Historical	00000128	hp
00000133	Review of medication class based on CCC(i.e. CoBraD)	00000132	hp
00000134	Phyisical examination	null	hp
00000135	General	00000134	hp
00000136	Anthropometrics	00000135	hp
00000137	HENT	00000134	hp
00000138	Nasal	00000137	hp
00000139	Oral-Pharyngeal	00000137	hp
00000140	Frenulum length	00000137	hp
00000141	Tonsils	00000137	hp
00000142	Jaw alignment(vs retrognathia)	00000137	hp
00000143	Palate shape	00000137	hp
00000144	Cardiac	00000134	hp
00000145	Respiratory	00000134	hp
00000146	Neurological	00000134	hp
00000147	Mental Status and Demeanour	00000146	hp
00000148	Cranial nerves	00000146	hp
00000149	Strength and Reflexes	00000146	hp
00000150	Sensation and Perception	00000146	hp
00000151	Coordination and Balance	00000146	hp
00000152	Neuropsychological Testing	null	hp
00000153	Regulatory(Alertness, Attention, Processing speed)	00000152	hp
00000154	Memory	00000152	hp
00000155	Language	00000152	hp
00000156	Visuospatial	00000152	hp
00000157	Executive	00000152	hp
00000158	Qualitative observations	00000152	hp
00000159	Laboratory testing	null	hp
00000160	Biosamples	00000159	hp
00000161	Imaging	00000159	hp
00000162	Neurophysiology	00000159	hp
\.

COPY stscategories (category_id, name, parent_id) FROM stdin;
00000001	Severity	null
00000002	Presence	00000001
00000003	Severity	00000001
00000004	Chronic and Episodic Duration	null
00000005	Chronic duration	00000004
00000006	Episode duration	00000004
00000007	Usual	00000006
00000008	Longest	00000006
00000009	Progression	null
00000010	Gradual	00000009
00000011	Stepwise	00000009
00000012	Stable	00000009
00000013	Relapsing Remitting	00000009
00000014	Frequency and Rhytmicity of Events	null
00000015	Frequency	00000014
00000016	Periodicity	00000014
00000017	Location	null
00000018	Body part(Ocular, Axial, Arms, Legs)	00000017
00000019	Symmetry	00000017
00000020	Symptom perception	null
00000021	Positive vs Negative	00000020
\.

ALTER TABLE ONLY languages
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);
    
ALTER TABLE ONLY questionnaires
    ADD CONSTRAINT questionnaire_pkey PRIMARY KEY (questionnaire_id),
    ADD CONSTRAINT fk_language FOREIGN KEY(language_id) REFERENCES languages(language_id);
    
ALTER TABLE ONLY questions
    ADD CONSTRAINT question_pkey PRIMARY KEY (question_id),
    ADD CONSTRAINT fk_questionnaire FOREIGN KEY(questionnaire_id) REFERENCES questionnaires(questionnaire_id);
        
ALTER TABLE ONLY questions_variables
    ADD CONSTRAINT fk_question FOREIGN KEY(question_id) REFERENCES questions(question_id),
    ADD CONSTRAINT fk_variable FOREIGN KEY(variable_id) REFERENCES variables(variable_id);
    
ALTER TABLE ONLY translations
    ADD CONSTRAINT translation_pkey PRIMARY KEY (translation_id),
    ADD CONSTRAINT fk_question FOREIGN KEY(question_id) REFERENCES questions(question_id),
    ADD CONSTRAINT fk_language FOREIGN KEY(language_id) REFERENCES languages(language_id);
    
ALTER TABLE ONLY concepts_variables
    ADD CONSTRAINT fk_concept FOREIGN KEY(concept_id) REFERENCES concepts(concept_id),
    ADD CONSTRAINT fk_variable FOREIGN KEY(variable_id) REFERENCES variables(variable_id);
    
ALTER TABLE ONLY stscategories_variables
    ADD CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES stscategories(category_id),
    ADD CONSTRAINT fk_variable FOREIGN KEY(variable_id) REFERENCES variables(variable_id);

ALTER TABLE ONLY concepts
    ADD CONSTRAINT concept_pkey PRIMARY KEY (concept_id);
    
ALTER TABLE ONLY stscategories
    ADD CONSTRAINT sts_pkey PRIMARY KEY (category_id);
    
ALTER TABLE ONLY variables
    ADD CONSTRAINT variable_pkey PRIMARY KEY (variable_id);

COMMIT;

ANALYZE languages;
ANALYZE questionnaires;
ANALYZE questions;
ANALYZE questions_variables;
ANALYZE concepts_variables;
ANALYZE stscategories_variables;
ANALYZE translations;
ANALYZE concepts;
ANALYZE variables;
ANALYZE stscategories; 
  