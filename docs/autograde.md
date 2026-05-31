# Autograding des del repositori del professor

Este template inclou el workflow `.github/workflows/autograde-from-teacher.yml`.
El workflow connecta el repositori individual de l'alumne amb el repositori central del professor i usa eixe repositori com a font de veritat per resoldre el microrepte actiu i executar l'autograding.

## Configuració necessària

En el repositori de l'alumne cal definir estos secrets o variables:

- `TEACHER_REPO_URL`: URL del repositori del professor.
- `TEACHER_REPO_REF`: branca o tag del repositori del professor. Per defecte, `main`.
- `TEACHER_REPO_TOKEN`: token opcional si el repositori del professor és privat.
- `OPENAI_API_KEY`: necessari només per al mode `openai`.
- `OPENAI_MODEL`: model opcional. Per defecte, `gpt-4o-mini`.

## Modes d'execució

- `mock`: mode per defecte en cada `push`. No necessita credencials d'OpenAI.
- `openai`: mode manual des de `workflow_dispatch`. Necessita `OPENAI_API_KEY`.

## Grup i alumne

El workflow necessita resoldre el grup docent. Es pot indicar manualment en `workflow_dispatch` amb l'input `group`.

També es pot crear un fitxer opcional `student-meta.json` a l'arrel del repositori:

```json
{
  "student": "cipfpbatoi/dwes-nom-cognom",
  "group": "2DAW-A"
}
```

Si no hi ha grup, el workflow només continua si disposa d'un identificador d'alumne o repositori que permeta al repositori del professor resoldre el microrepte actiu.

## Artefactes generats

Durant l'execució, el workflow genera fitxers dins de `_artifacts/`:

- `repo-signals.json`
- `evidence-summary.json`
- `evaluation-payload.json`
- `autograde-result.json`
- `openai-raw-response.json`, només si aplica

El payload que rep el corrector inclou els senyals bàsics del repositori i fragments dels fitxers principals de `README.md`, `docs/`, `evidence/`, `tests/` i `src/`. Això permet que el mode `openai` valore evidències reals del repositori, no només la rúbrica i el nom del microrepte.

En esta primera versió no es publiquen comentaris automàtics en PR ni commits. El resultat es veu en el log i en el GitHub Step Summary.
