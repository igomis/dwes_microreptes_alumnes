# Branques, pull requests i historial d’entregues

La correcció ordinària continua llegint `main`. Recomanem molt treballar amb una branca per repte i una per microrepte, conservar-les i integrar cada entrega amb pull requests (PR). Així pots tornar al codi i al README d’una entrega quan apareguen dubtes. És una recomanació de treball, sense penalitzacions automàtiques noves.

## El recorregut d’una entrega

```text
microrepte/r2m1 → repte/r2 → main
                PR 1       PR 2
```

| Referència | Funció |
|---|---|
| `main` | Última entrega integrada, disponible per a correcció. |
| `repte/r2` | Integra el treball del Repte 2. Es crea des de `main`. |
| `microrepte/r2m1` | Desenvolupament de R2M1. Es crea des de `repte/r2`. |
| `entrega-r2m1-v1` | Etiqueta del commit de `main` entregat, que es conserva sense moure-la. |

Substituïx els codis pels del teu repte i microrepte. R2S0 és introductòria i no necessita una branca de microrepte ni una entrega pròpia. No esperes a acabar tot el repte per integrar en `main`: fes-ho en cada microrepte.

## 1. Crear la branca del repte, una sola vegada

Comença amb els canvis anteriors guardats en commits i `git status` net:

```bash
git switch main
git pull --ff-only origin main
git switch -c repte/r2
git push -u origin repte/r2
```

Si la branca ja existix localment, usa `git switch repte/r2`. Si només existix en GitHub, fes `git fetch origin` i `git switch --track origin/repte/r2`; no la tornes a crear des de zero.

## 2. Crear la branca del microrepte i treballar

```bash
git switch repte/r2
git pull --ff-only origin repte/r2
git fetch origin
git merge origin/main
git push origin repte/r2
git switch -c microrepte/r2m1
git push -u origin microrepte/r2m1
```

La sincronització amb `main` incorpora també els resultats que haja publicat el corrector. Escriu codi, actualitza el README, guarda evidències i registra l’ús real d’IA quan corresponga. Fes commits amb sentit mentre avances:

```bash
git status
git diff
git add README.md
# Afig també, pel seu camí, els fitxers de codi i evidències modificats.
git diff --cached
git commit -m "R2M1: entrada i comprovacions inicials"
git push
```

Abans de continuar, comprova que has pujat tots els fitxers necessaris, que les proves documentades funcionen i que el README descriu el microrepte actual.

## 3. PR del microrepte al repte

En el teu repositori individual de GitHub, entra en **Pull requests → New pull request**:

- **base:** `repte/r2` (destinació).
- **compare:** `microrepte/r2m1` (origen).
- Títol: `R2M1: entrada i validació bàsica`.
- Descripció: què has fet, com ho has provat, evidències i dubtes pendents.

Revisa **Files changed**, comprova que no falten fitxers i resol els conflictes si n’hi ha. Quan estiga preparat, tria **Create a merge commit → Merge pull request → Confirm merge**. Conserva la branca del microrepte; no premes **Delete branch**.

Fes tu el merge en el teu repositori, si tens permisos. GitHub no permet enviar una revisió formal **Approve** sobre una PR pròpia: revisar els teus canvis i fer el merge són accions diferents d’eixa aprovació formal. Si una regla exigix una revisió externa o impedix el merge, consulta el professorat.

Usem merge commits per conservar els commits originals i el recorregut entre branques. En este procediment no tries **Squash and merge** ni **Rebase and merge**.

## 4. PR del repte a main, en cada entrega

Crea una segona PR:

- **base:** `main`.
- **compare:** `repte/r2`.
- Títol: `Entrega R2M1`.
- Inclou l’enllaç a la PR anterior, les comprovacions i qualsevol limitació.

Revisa-la i integra-la també amb **Create a merge commit**. Conserva `repte/r2`, perquè la reutilitzaràs en el microrepte següent. Comprova en GitHub, seleccionant `main`, que el codi, el README i les evidències de R2M1 hi són.

Una PR oberta o integrada només en `repte/r2` encara no deixa el treball en la branca corregible. Fer merge tampoc selecciona el microrepte ni llança necessàriament una correcció: això ho gestiona el professorat.

## 5. Conservar la versió exacta entregada

En la PR `Entrega R2M1` ja integrada, copia el SHA del **merge commit**. Usa eixe SHA, perquè `main` podria haver avançat amb una altra entrega o amb resultats del corrector:

```bash
git switch main
git pull --ff-only origin main
git fetch origin
git show --stat SHA_DEL_MERGE
git tag -a entrega-r2m1-v1 SHA_DEL_MERGE -m "Entrega R2M1 v1"
git push origin entrega-r2m1-v1
```

`SHA_DEL_MERGE` és un marcador: substituïx-lo pel SHA real. Anota la PR i l’etiqueta en les notes del microrepte. L’etiqueta marca l’entrega; el resultat d’autocorrecció pot referir-se a un commit posterior de `main`, que has de consultar en el mateix resultat.

## 6. Continuar amb el següent microrepte

Amb el directori de treball net, sincronitza i crea una branca nova:

```bash
git switch repte/r2
git pull --ff-only origin repte/r2
git fetch origin
git merge origin/main
git push origin repte/r2
git switch -c microrepte/r2m2
git push -u origin microrepte/r2m2
```

Repetix les dues PR per a R2M2. Deixa `microrepte/r2m1` com a referència de la seua feina. En acabar R2, conserva `repte/r2`; crea `repte/r3` des de `main` actualitzada. Les etiquetes permeten consultar el punt exacte de cada entrega encara que després evolucione una branca.

## Consultar una entrega o fer una correcció

En GitHub pots seleccionar una branca o etiqueta per veure els fitxers d’aquell moment. Localment:

```bash
git fetch origin --tags
git show entrega-r2m1-v1:README.md
git log --graph --oneline --all
```

Per executar una versió antiga sense canviar el directori de treball actual:

```bash
git worktree add --detach ../consulta-r2m1 entrega-r2m1-v1
```

Usa una carpeta de destí que no existisca i seguix allí les instruccions d’execució del README d’aquella versió. Quan acabes, i si no hi ha canvis que vulgues conservar, elimina el directori auxiliar amb `git worktree remove ../consulta-r2m1`.

Per corregir una entrega abans de continuar el mateix repte, crea `microrepte/r2m1-revisio-2` des de la branca del repte sincronitzada, repetix les dues PR i crea `entrega-r2m1-v2`. No mogues ni sobreescrigues `v1`.

Si ja treballes en un repte posterior, consulta el professorat abans de preparar una recorrecció antiga: canviar una etiqueta no canvia què es corregix en `main`. No restaures tot `main` a una entrega antiga; porta només la correcció necessària al treball actual.

## Si hi ha conflictes

Per a una PR microrepte → repte, actualitza la branca del microrepte amb la destinació:

```bash
git switch microrepte/r2m1
git fetch origin
git merge origin/repte/r2
```

Per a una PR repte → main, fes el mateix des de `repte/r2` amb `git merge origin/main`. Revisa els fitxers en conflicte, resol els marcadors, guarda els fitxers amb `git add CAMI_DEL_FITXER`, prova el resultat i completa el merge amb `git commit` i `git push`. La PR s’actualitzarà. Si no saps resoldre’l, `git merge --abort` cancel·la el merge en curs; demana ajuda. No uses `push --force` per resoldre una divergència.

Si `git pull --ff-only` falla, revisa `git status` i `git log --graph --oneline --all` abans de continuar; no descartes canvis locals per fer-lo passar.

## Checklist abans de demanar correcció

- [ ] PR microrepte → repte integrada.
- [ ] PR repte → main integrada amb el README actual i les evidències.
- [ ] Execució i comprovacions revisades sobre la versió integrada.
- [ ] Branques conservades i etiqueta d’entrega pujada.
- [ ] PR, etiqueta i dubtes localitzables en les notes.

## Preparació docent del repositori

Per facilitar este flux, el professorat ha de comprovar que l’alumnat té permís de merge, que estan permesos els merge commits i que no hi ha una exigència d’aprovació externa incompatible amb el treball individual. Convé desactivar l’eliminació automàtica de branques després del merge. Si ja s’ha eliminat una branca, la PR i les etiquetes continuen servint per consultar l’historial. Esta guia no modifica els permisos ni la configuració dels repositoris existents.

Referències: [integrar una PR en GitHub](https://docs.github.com/en/pull-requests/how-tos/merge-and-close-pull-requests/merging-a-pull-request) i [limitacions d’aprovació pròpia](https://docs.github.com/en/pull-requests/how-tos/review-pull-requests/approving-a-pull-request-with-required-reviews).
