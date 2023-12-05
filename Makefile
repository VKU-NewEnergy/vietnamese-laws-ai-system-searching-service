#  Copyright (c) VKU.NewEnergy.

#  This source code is licensed under the Apache-2.0 license found in the
#  LICENSE file in the root directory of this source tree.

prepare-environments:
	cp .env.example .env
	cd topic && cp .env.example .env
	cd subject && cp .env.example .env
	cd charter && cp .env.example .env
	cd indexing && cp .env.example .env
	cd legal-document && cp .env.example .env
	cd feedback && cp .env.example .env

import-data:
	cd init-data && psql -U vietnam_laws -h localhost -p 7432 -d vietnam_laws_topics -f vietnam_laws_topics.sql
	cd init-data && psql -U vietnam_laws -h localhost -p 7432 -d vietnam_laws_subjects -f vietnam_laws_subjects.sql
	cd init-data && psql -U vietnam_laws -h localhost -p 7432 -d vietnam_laws_indexing -f vietnam_laws_indexing.sql
	cd init-data && psql -U vietnam_laws -h localhost -p 7432 -d vietnam_laws_charters -f vietnam_laws_charters.sql
	cd init-data && psql -U vietnam_laws -h localhost -p 7432 -d vietnam_laws_legal_documents -f vietnam_laws_legal_documents.sql
	
install:
	make prepare-environments
	docker-compose up -d --build
	gdown --id 1eyYEydC-6TQ3uD2WO4cXpR0Odg3f3Pod
	unzip database.zip -d init-data
	make import-data