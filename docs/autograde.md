# Autograding des del repositori del professor

Este template no inclou workflows de GitHub Actions propis. La correcció es llança des del repositori central del professorat, que clona el repositori individual de l'alumne, recull evidències i publica el resultat quan correspon.

## Configuració necessària en l'alumnat

En el repositori de l'alumne no cal definir secrets ni variables d'autograding.

La clau `OPENAI_API_KEY` tampoc s'ha de configurar en cada repositori d'alumne. La correcció real amb IA es llança des del repositori del professor amb el workflow massiu `Batch autograde student repositories`.

## Branca de lliurament

La branca ordinària de lliurament és `main`.

Si treballes en una branca pròpia, integra el resultat en `main` abans de demanar correcció.

## Grup i alumne

El sistema de correcció resol el grup docent des de la llista central de repositoris que manté el professorat. L'alumnat no ha de crear cap fitxer de configuració per a l'autocorrecció.

## Artefactes generats

Durant la correcció massiva, el repositori del professor genera fitxers temporals d'avaluació:

- `repo-signals.json`
- `evidence-summary.json`
- `evaluation-payload.json`
- `autograde-result.json`
- `openai-raw-response.json`, només si aplica

El payload que rep el corrector inclou els senyals bàsics del repositori i fragments dels fitxers principals de `README.md`, `docs/`, `evidence/`, `tests/` i `src/`. Esta recollida es fa amb scripts del repositori del professorat, no amb scripts modificables per l'alumnat. `ENTREGA.md` és la guia base del template i pot aparéixer com a context, però no és la fitxa d'entrega. Els README de carpeta (`docs/README.md`, `evidence/README.md`, `tests/README.md`) i esta guia d'autograding no es tracten com a evidències del microrepte.

Quan el professorat executa la correcció massiva amb IA, el resultat es publica en el repositori de l'alumne:

- `autograde/latest.md`: resum llegible per a l'alumne.
- `autograde/latest.json`: resultat estructurat per a revisió o importació.
- `autograde/README.md`: índex visible de correccions.
- `autograde/history/`: historial de valoracions anteriors.
