# Microreptes DWES

Repositori individual de treball de l'alumne per als microreptes de DWES.

Este repositori conté el treball real de l'alumne: codi, evidències, documentació mínima i, quan corresponga, traça d'ús de la IA.

No és el repositori que defineix la rúbrica ni l'autocorrecció activa. Eixa informació es resol des del repositori central del professorat.

## Branca corregible

La branca ordinària de lliurament i correcció és:

```text
main
```

Este repositori base pot mantindre compatibilitat amb `master` mentre es fa la transició, però el criteri de treball per a l'alumnat és deixar el lliurament corregible en `main`.

Pots treballar en branques pròpies si t'ajuda a organitzar-te, per exemple `r2m3`, `r3m5` o `feature/auth`, però abans de demanar correcció has d'integrar el treball en `main`.

El nom de la branca no decideix quin microrepte es corregeix. El microrepte actiu el configura el professorat des del sistema d'autocorrecció.

## Microrepte actual

Mantín este apartat actualitzat en cada entrega.

| Camp | Valor |
|---|---|
| Microrepte | `R1M1`, `R2M3`, `R3M5`... |
| Què he fet |  |
| Com provar-ho |  |
| Evidències principals |  |

Exemple d'evidències:

- `docs/r2m3.md`
- `evidence/r2m3/`
- `tests/`

## Organització recomanada

`main` acumularà el projecte complet al llarg del curs. Perquè això no siga confús, cada microrepte ha de quedar localitzable.

```text
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

## Com executar-lo

Indica els passos mínims per arrancar el projecte o provar la funcionalitat.

Exemple:

```bash
# pendent d'adaptar segons la tecnologia usada
```

## Com verificar-lo

Explica com comprovar que el treball funciona o que les evidències són revisables.

Pots incloure:

- tests automàtics;
- prova manual;
- peticions HTTP;
- captures textuals;
- logs;
- enllaços a documents dins de `docs/` o `evidence/`.

## Decisions tècniques

Registra les decisions importants preses durant el microrepte.

- Decisió:
- Motiu:
- Alternatives descartades:
- Dubtes pendents:

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
- resum del que s'ha suggerit;
- què s'ha acceptat;
- què s'ha rebutjat o modificat;
- com s'ha verificat.

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

- [ ] actualitza l'apartat `Microrepte actual`;
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

Després del `push`, revisa en GitHub que els fitxers s'han pujat i que la pestanya `Actions` no mostra cap error inesperat.

## Estat actual

Repositori base preparat per començar el treball de l'alumne.
