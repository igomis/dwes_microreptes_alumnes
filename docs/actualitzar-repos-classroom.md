# Actualitzar repositoris ja generats per GitHub Classroom

Els repositoris creats per GitHub Classroom no hereten automàticament els canvis posteriors del repositori base.

Si el template `dwes-microreptes-alumnes` canvia, cada repositori d'alumne ja creat s'ha d'actualitzar manualment o amb un commit automatitzat.

## Fitxers mínims que cal sincronitzar

Perquè l'autocorrecció actual funcione amb evidències reals del repositori de l'alumne, copia o actualitza estos fitxers:

- `.github/workflows/autograde-from-teacher.yml`
- `scripts/build-student-repo-signals.sh`
- `scripts/collect-student-evidence.sh`
- `docs/autograde.md`

El `README.md`, `docs/ai-log.md`, `evidence/README.md` i `tests/README.md` són recomanables, però si l'alumne ja els ha modificat no convé sobreescriure'ls sense revisar.

## Configuració del repositori d'alumne

En cada repositori d'alumne cal definir:

- `AUTOGRADE_GROUP`: grup docent, per exemple `2DAW-A`.
- `OPENAI_API_KEY`: secret de GitHub, només si es vol usar el mode `openai`.
- `OPENAI_MODEL`: variable opcional, per exemple `gpt-4o-mini`.

Si el repositori central del professor és privat, també cal:

- `TEACHER_REPO_TOKEN`: secret amb permís de lectura sobre el repositori del professor.

## Prova manual

Des de GitHub Actions del repositori d'alumne:

1. Obri `Autograde from teacher repo`.
2. Executa `Run workflow`.
3. Indica `mode = mock` per comprovar el flux sense API.
4. Després indica `mode = openai` per provar la correcció amb API.

El workflow genera estos artefactes:

- `repo-signals.json`
- `evidence-summary.json`
- `evaluation-payload.json`
- `autograde-result.json`
- `openai-raw-response.json`, només en mode `openai`.

Si el repositori d'alumne usa `master` com a branca principal, el workflow també s'executa en `push` a `master`.
