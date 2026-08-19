# Autograding des del repositori del professor

Este template inclou el workflow `.github/workflows/autograde-from-teacher.yml`.
El workflow connecta el repositori individual de l'alumne amb el repositori central del professor i usa eixe repositori com a font de veritat per resoldre el microrepte actiu i executar l'autograding.

## Configuració necessària

En el repositori de l'alumne cal definir estos secrets o variables:

- `TEACHER_REPO_REF`: branca o tag del repositori del professor. Per defecte, `main`.
- `TEACHER_REPO_TOKEN`: token opcional si el repositori del professor és privat.

La clau `OPENAI_API_KEY` no cal configurar-la en cada repositori d'alumne. La correcció real amb IA es llança des del repositori del professor amb el workflow massiu `Batch autograde student repositories`.

## Modes d'execució

- `mock`: mode per defecte en cada `push`. No necessita credencials d'OpenAI.
- `openai`: mode manual compatible, però el flux recomanat és executar-lo des del repositori del professor.

## Branca de lliurament

La branca ordinària de lliurament és `main`. El workflow també pot executar-se en `master` per compatibilitat, però el criteri general del curs és deixar el treball corregible en `main`.

Si treballes en una branca pròpia, integra el resultat en `main` abans de demanar correcció.

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

El payload que rep el corrector inclou els senyals bàsics del repositori i fragments dels fitxers principals de `ENTREGA.md`, `README.md`, `docs/`, `evidence/`, `tests/` i `src/`. Això permet que el mode `openai` valore evidències reals del repositori, no només la rúbrica i el nom del microrepte.

Quan el professorat executa la correcció massiva amb IA, el resultat es publica en el repositori de l'alumne:

- `autograde/latest.md`: resum llegible per a l'alumne.
- `autograde/latest.json`: resultat estructurat per a revisió o importació.

El resultat del workflow local del repo d'alumne es veu en el log i en el GitHub Step Summary.
