# Autograding des del repositori del professor

Este template no inclou workflows de GitHub Actions propis. La correcció es llança des del repositori central del professorat, que clona el repositori individual de l'alumne, recull evidències i publica el resultat quan correspon.

## Configuració necessària en l'alumnat

En el repositori de l'alumne no cal definir secrets ni variables d'autograding.

La clau `OPENAI_API_KEY` tampoc s'ha de configurar en cada repositori d'alumne. La correcció real amb IA es llança des del repositori del professor amb el workflow massiu `Batch autograde student repositories`.

## Scripts de suport

El repositori conserva dos scripts en `scripts/`:

- `build-student-repo-signals.sh`: genera un resum automàtic de senyals del repositori, com presència de `README.md`, `docs/ai-log.md`, `src/`, `tests/`, `evidence/` i recompte de fitxers.
- `collect-student-evidence.sh`: recull fragments revisables de `README.md`, `docs/`, `evidence/`, `tests/` i `src/` per construir el payload que rebrà el corrector.

Estos scripts no s'executen sols. Els executa el workflow massiu del professorat després de clonar el repositori de l'alumne.

## Branca de lliurament

La branca ordinària de lliurament és `main`.

Si treballes en una branca pròpia, integra el resultat en `main` abans de demanar correcció.

## Grup i alumne

El sistema de correcció necessita resoldre el grup docent. El professorat pot indicar-lo des del workflow massiu o des de la llista central de repositoris.

També es pot crear un fitxer opcional `student-meta.json` a l'arrel del repositori:

```json
{
  "student": "cipfpbatoi/dwes-nom-cognom",
  "group": "2DAW-A"
}
```

Si no hi ha grup, el workflow només continua si disposa d'un identificador d'alumne o repositori que permeta al repositori del professor resoldre el microrepte actiu.

## Artefactes generats

Durant la correcció massiva, el repositori del professor genera fitxers temporals d'avaluació:

- `repo-signals.json`
- `evidence-summary.json`
- `evaluation-payload.json`
- `autograde-result.json`
- `openai-raw-response.json`, només si aplica

El payload que rep el corrector inclou els senyals bàsics del repositori i fragments dels fitxers principals de `README.md`, `docs/`, `evidence/`, `tests/` i `src/`. `ENTREGA.md` és la guia base del template i pot aparéixer com a context, però no és la fitxa d'entrega. Els README de carpeta (`docs/README.md`, `evidence/README.md`, `tests/README.md`) i esta guia d'autograding no es tracten com a evidències del microrepte.

Quan el professorat executa la correcció massiva amb IA, el resultat es publica en el repositori de l'alumne:

- `autograde/latest.md`: resum llegible per a l'alumne.
- `autograde/latest.json`: resultat estructurat per a revisió o importació.
- `autograde/README.md`: índex visible de correccions.
- `autograde/history/`: historial de valoracions anteriors.
