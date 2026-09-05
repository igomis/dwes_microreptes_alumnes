# Microreptes DWES

Repositori individual de treball de l'alumne per als microreptes de DWES.

Este repositori conté el treball real de l'alumne: codi, evidències, documentació mínima i, quan corresponga, traça d'ús de la IA.

No és el repositori que defineix la rúbrica ni l'autocorrecció activa. Eixa informació es resol des del repositori central del professorat.

Este fitxer és part del repositori base. No l'uses com a fitxa d'entrega del microrepte. Per a cada entrega, actualitza `README.md` i els fitxers necessaris de `docs/`, `evidence/`, `tests/` i `src/` o `app/`.

Els README de `docs/`, `evidence/` i `tests/` són guies de carpeta del template. No cal modificar-los per entregar un microrepte.

## Branca corregible

La branca ordinària de lliurament i correcció és:

```text
main
```

Pots treballar en branques pròpies si t'ajuda a organitzar-te, per exemple `r2m3`, `r3m5` o `feature/auth`, però abans de demanar correcció has d'integrar el treball en `main`.

El nom de la branca no decideix quin microrepte es corregeix. El microrepte actiu el configura el professorat des del sistema d'autocorrecció.

## Fitxer d'entrega

El fitxer que l'alumne ha de mantindre actualitzat és `README.md`, el de l'arrel del repositori.

`README.md` representa l'entrega actual. En cada microrepte es pot sobreescriure el contingut del microrepte anterior i substituir-lo pel nou. No és necessari mantindre en este fitxer l'historial complet del curs.

En cada microrepte ha d'indicar:

- quin microrepte entrega;
- què ha fet;
- com es pot provar;
- on estan les evidències principals;
- decisions tècniques o dubtes rellevants.

Si una explicació d'un microrepte anterior s'ha de conservar, passa-la a un fitxer específic de `docs/`, per exemple `docs/r2m3.md`. Així `README.md` continua sent ràpid de revisar i sempre apunta al treball que toca corregir.

## Diferència entre els README

| Fitxer | Per a què serveix | L'ha d'omplir l'alumnat? |
|---|---|---|
| `README.md` | Fitxa de l'entrega actual: microrepte, què s'ha fet, com provar-ho i on són les evidències. | Sí, en cada microrepte. Es pot sobreescriure. |
| `docs/README.md` | Guia de què es guarda en `docs/`. | No habitualment. |
| `evidence/README.md` | Guia de què es guarda en `evidence/`. | No habitualment. |
| `tests/README.md` | Guia de què es guarda en `tests/`. | No habitualment. |
| `ENTREGA.md` | Instruccions generals del curs i criteri d'entrega. | No. És una guia de consulta. |

## Organització recomanada

`main` acumularà el projecte complet al llarg del curs. Perquè això no siga confús, cada microrepte ha de quedar localitzable.

```text
ENTREGA.md
README.md
docs/
  r2m3.md
  r2m4.md
  ai-log.md
evidence/
  r2m3/
  r2m4/
tests/
src/ o app/
```

No cal crear totes les carpetes si el microrepte no les necessita. El que sí cal és que el treball actual es puga trobar i provar.

Els fitxers recomanats per microrepte són:

- `README.md`: resum actual i enllaços principals.
- `docs/rXmY.md`: explicació més llarga, decisions tècniques o notes de disseny.
- `evidence/rXmY/`: captures, logs, respostes HTTP, traces o resultats manuals.
- `tests/`: proves automàtiques quan el microrepte les demane o quan ajuden a verificar el treball.

## Com executar-lo

Els passos concrets per arrancar o provar cada microrepte s'han d'escriure en `README.md` o en el document corresponent de `docs/`.

## Com verificar-lo

L'alumne ha de deixar en `README.md` o en `docs/` com comprovar que el treball funciona o que les evidències són revisables.

Pots incloure:

- tests automàtics;
- prova manual;
- peticions HTTP;
- captures textuals;
- logs;
- enllaços a documents dins de `docs/` o `evidence/`.

## Decisions tècniques

Les decisions importants de cada microrepte s'han de registrar en `README.md` o en un document específic de `docs/`, per exemple `docs/r2m3.md`.

## Evidències

- `docs/`: documentació del treball, decisions tècniques i registre d'ús d'IA si correspon.
- `evidence/`: captures textuals, logs, comprovacions o altres evidències, preferentment en una carpeta amb el codi del microrepte.
- `tests/`: proves automàtiques o fitxers relacionats amb la verificació.
- `src/` o `app/`: codi font quan el microrepte ho demane.

Exemple:

```text
evidence/r2m3/
docs/r2m3.md
```

## Què no has de tocar

- No has de decidir manualment quina autocorrecció està activa.
- No has d'editar rúbriques ni configuració docent.
- No has de modificar la política global d'avaluació.
- No has de tocar fitxers del repositori central del professorat.

## AI log

Quan el microrepte ho exigisca, cal afegir `docs/ai-log.md` amb:

- objectiu de la consulta a la IA;
- pregunta o prompte literal que s'ha escrit;
- resum del que s'ha suggerit;
- què s'ha acceptat;
- què s'ha rebutjat o modificat;
- com s'ha verificat.

No cal copiar tota la conversa. Sí que convé copiar el text exacte de la pregunta principal perquè es puga veure si estava alineada amb l'objectiu declarat.

L'ús de la IA no substitueix la comprensió, la verificació ni l'autoria del treball.

## Avaluació

La correcció automàtica i la nota provisional es generen a partir de:

- el contingut del repositori;
- les evidències disponibles;
- les proves o verificacions;
- la traçabilitat del treball;
- la rúbrica definida al repositori central del professorat.

La nota automàtica és provisional i pot requerir revisió docent.

## Com pujar una entrega

Abans d'entregar:

- [ ] actualitza `README.md`;
- [ ] comprova que les evidències estan dins del repositori;
- [ ] comprova que no has pujat secrets reals, tokens o fitxers temporals;
- [ ] integra el treball en `main`.

Comandes habituals:

```bash
git status
git add .
git commit -m "Entrega R2M3"
git push origin main
```

Canvia `R2M3` pel microrepte que estàs entregant.

Després del `push`, revisa en GitHub que els fitxers s'han pujat correctament.

## Estat actual

Repositori base preparat per començar el treball de l'alumne.
