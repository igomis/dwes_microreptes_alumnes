# Repositori, branques i entrega del treball

Esta és la guia única per accedir al repositori, treballar amb branques, preparar evidències, integrar l’entrega i consultar la correcció. La branca ordinària de correcció és **`main`**. Recomanem una branca per repte i una per microrepte per conservar el procés, sense afegir penalitzacions automàtiques noves.

## Primer accés: invitació i git clone

El professorat crea el teu repositori individual en GitHub i et convida com a col·laborador. **Acceptar la invitació et dona accés a un repositori que ja existix; no en crea un altre.** Eixe repositori s’usa durant tot el curs.

1. Inicia sessió en GitHub amb l’usuari que has comunicat al professorat.
2. Accepta la invitació rebuda per correu o des de l’enllaç que et facilite.
3. Obri el repositori assignat i comprova que pots veure’n els fitxers.
4. En **Code**, copia la URL de clonatge del teu repositori, amb HTTPS o SSH segons l’accés que tingues configurat.
5. Des d’una carpeta del teu ordinador on guardes projectes, executa:

```bash
git clone URL_DEL_REPOSITORI_ASSIGNAT
cd NOM_DEL_REPOSITORI
git remote -v
git status
git branch --show-current
```

Substituïx els dos marcadors per la URL real i el nom de la carpeta creada per `git clone`. Comprova que `origin` apunta al repositori que t’ha assignat el professorat i que la branca inicial és `main`. Si el repositori està buit, usa una altra branca o no tens accés, consulta el professorat abans de continuar.

El clonatge descarrega el repositori i el seu historial i configura `origin`. Es fa una vegada per ordinador o còpia de treball. No cal crear abans una carpeta amb `git init`, fer un fork, descarregar un ZIP ni clonar la plantilla docent. Si ja tens esta còpia, entra en ella i sincronitza-la; no repetisques el clonatge per a cada sessió.

En R1S1, treballa en `microrepte/r1m1`, actualitza el README i la fitxa inicial, fes commit i push i seguix les dues PR descrites més avall. Així el primer treball queda integrat en `main` per a la correcció.

## On ha d'estar el treball

| Tipus de contingut | On posar-ho |
|---|---|
| Fitxa d'entrega del microrepte, com arrancar i com provar | `README.md` |
| Decisions tècniques, notes breus o registre d'ús d'IA | `docs/` |
| Captures textuals, logs, resultats de proves o comprovacions | `evidence/` |
| Tests automàtics o fitxers relacionats amb proves | `tests/` |
| Codi de l'aplicació | `src/`, `app/` o l'estructura pròpia del projecte |

Si una evidència és important, ha d'estar en el repositori i ha de tindre un nom clar.

## README i evidències de cada microrepte

El `README.md` de l’arrel descriu l’entrega actual: codi del microrepte, què has fet, com executar-ho, com provar-ho i enllaços a les evidències. Pot substituir la descripció del microrepte anterior, perquè les branques i etiquetes en conserven la versió. Si necessites una explicació anterior dins de la versió actual, guarda-la en `docs/r2m1.md` o un fitxer equivalent.

`ENTREGA.md` i els README de carpeta són instruccions de la plantilla; no cal reescriure’ls en cada entrega. Els fitxers de treball han de ser localitzables, per exemple `docs/r2m1.md` i `evidence/r2m1/`. Registra només l’ús real d’IA i les comprovacions que has fet.

Abans del commit, revisa que no falten fitxers necessaris, que les ordres del README funcionen i que no has inclòs secrets, dades personals innecessàries ni fitxers temporals. Tens [dos exemples de README omplits](#exemples-de-readme-omplits) al final d’esta guia.

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

Els exemples següents usen R2M1. En la primera sessió substituïx `repte/r2` per `repte/r1` i `microrepte/r2m1` per `microrepte/r1m1`; en R1M2 reutilitza `repte/r1` i crea `microrepte/r1m2`. Comença amb els canvis anteriors guardats en commits i `git status` net:

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

Abans de continuar, comprova que has pujat tots els fitxers necessaris, que les proves documentades funcionen i que el README descriu el microrepte actual. Un `push` de la branca del microrepte guarda el treball en GitHub, però encara falta integrar-lo en `main`.

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

Les branques i etiquetes dels microreptes conserven el treball d’aula original. Pots corregir codi per continuar aprenent, però no hi ha recuperació ni reentrega avaluable individual del microrepte.

Si has de recuperar el repte complet, acorda amb el professorat la versió i les evidències globals que revisarà. Identifica la branca de treball, per exemple `recuperacio/r2`, i conserva una etiqueta diferenciada del repte, com `recuperacio-r2-v1`. Si ja treballes en un repte posterior, acorda la integració abans de modificar `main`; no restaures tot el projecte a una entrega antiga. La valoració és docent i global, sense recorrecció automàtica dels microreptes.

## Si hi ha conflictes

Per a una PR microrepte → repte, actualitza la branca del microrepte amb la destinació:

```bash
git switch microrepte/r2m1
git fetch origin
git merge origin/repte/r2
```

Per a una PR repte → main, fes el mateix des de `repte/r2` amb `git merge origin/main`. Revisa els fitxers en conflicte, resol els marcadors, guarda els fitxers amb `git add CAMI_DEL_FITXER`, prova el resultat i completa el merge amb `git commit` i `git push`. La PR s’actualitzarà. Si no saps resoldre’l, `git merge --abort` cancel·la el merge en curs; demana ajuda. No uses `push --force` per resoldre una divergència.

Si `git pull --ff-only` falla, revisa `git status` i `git log --graph --oneline --all` abans de continuar; no descartes canvis locals per fer-lo passar.

## Després d’integrar en main

En GitHub, selecciona **`main`** i comprova que el README correspon al microrepte actual i que els seus enllaços porten als fitxers esperats. Una PR pendent o un `push` fet només a la branca de treball no deixa el microrepte en la branca corregible.

La correcció es llança des del repositori central del professorat. No has d’esperar un workflow propi en Actions del teu repositori després de cada push: la plantilla no el necessita. El professorat selecciona el microrepte que es corregix; el nom de la branca no el selecciona.

Quan es publique el resultat en el teu repositori, consulta `autograde/latest.md`. És el resum llegible amb la valoració, els comentaris i els punts que poden requerir revisió. `autograde/latest.json` conté dades estructurades; `autograde/history/`, si hi ha resultats anteriors, en conserva l’historial. L’absència d’un resultat nou no significa per si sola que el push haja fallat.

Abans del treball següent, sincronitza la branca del repte amb `origin/main` com indica el pas 6. Això incorpora també els resultats que el corrector haja afegit.

Els microreptes són treball d’aula sense recuperació individual. Corregir per aprendre no crea una nova entrega avaluable; la recuperació correspon al repte complet i es coordina amb el professorat.

## Checklist de l’entrega

- [ ] He acceptat la invitació i `origin` apunta al repositori assignat.
- [ ] El README identifica el microrepte actual i explica execució, proves i evidències.
- [ ] He revisat els fitxers afegits i he fet commit i push en la branca de treball.
- [ ] He integrat la PR microrepte → repte i la PR repte → main.
- [ ] He comprovat els fitxers i les proves de la versió integrada en `main`.
- [ ] He conservat branques i etiqueta del commit entregat, segons el flux recomanat.
- [ ] Sé on consultar el resultat quan el professorat publique la correcció.

## Problemes d’accés o entrega

| Situació | Què revisar |
|---|---|
| El repositori no apareix o diu «not found» | Invitació acceptada, usuari de GitHub correcte i URL assignada. |
| Pots veure el repositori però no fer push | Credencials Git de l’usuari convidat i permisos; consulta el professorat. |
| La feina està en GitHub però no en main | Les dues PR encara no estan integrades. |
| No apareix cap workflow en el teu repositori | La correcció es gestiona des del repositori docent. |
| El corrector no troba les evidències | Revisa README, camins i contingut de main. |

## Exemples de README omplits

Pots partir d'estos dos exemples del projecte fictici **Material Viu**, un servei per reservar material reutilitzable. Mostren com canvia el README entre una entrega documental i una entrega executable:

- [R1M1: fitxa i decisió tècnica](#exemple-r1m1-entrega-documental).
- [R1M2: entorn i landing](#exemple-r1m2-entrega-executable).

Són models de redacció: no acrediten proves fetes per tu ni creen els fitxers enllaçats. Adapta el producte, els noms de fitxer, els serveis, els ports, les ordres i els resultats al teu repositori. Conserva només els enllaços que existisquen i les afirmacions que pugues demostrar. Si una prova falla o queda pendent, escriu-ho amb el seu resultat real.

El README orienta la revisió; la fitxa, el codi i els logs han d'estar també dins del repositori. No cal modificar els README de les carpetes ni copiar tots els exemples d'ordres de la plantilla.

### Exemple R1M1: entrega documental

En R1M1 encara no es demana un servidor executable. La comprovació se centra en la fitxa, la coherència de la decisió i les fonts o consultes contrastades. Pots usar este contingut com a punt de partida del `README.md` de l'arrel:

````md
# Material Viu — R1M1

Material Viu vol facilitar la reserva de material reutilitzable per a activitats del barri.
La primera acció útil prevista serà sol·licitar un material per a una franja horària.

## Microrepte actual

| Camp | Valor |
|---|---|
| Microrepte | R1M1 — Model client/servidor i decisió tècnica inicial |
| Què he fet | He explicat el flux del producte, comparat PHP base, Laravel i NestJS i proposat una base inicial per a R1M2. |
| Com provar-ho | Llegir la fitxa i contrastar el flux i les decisions amb les preguntes de verificació d'este README. |
| Evidències principals | [Fitxa d'exploració](docs/r1m1.md) i [registre d'ús d'IA](docs/ai-log.md). |

## Model client/servidor del producte

El navegador mostrarà el material disponible amb HTML i CSS i enviarà peticions HTTP.
El servidor web rebrà les peticions i PHP executarà la lògica del backend.
El servidor retornarà HTML amb el resultat; el navegador no executarà PHP.

Quan implementem les reserves, el backend haurà de validar la franja sol·licitada.
No bastarà amb validar-la al navegador, perquè eixa comprovació es pot evitar.
La base de dades es consultarà des del backend, no directament des del client.

## Com executar-lo

Esta entrega és documental: encara no inclou una aplicació per arrancar.
Obri [docs/r1m1.md](docs/r1m1.md) en GitHub o en un editor de Markdown.

## Com verificar-lo

1. Localitza en la fitxa què fa el navegador, què fa el servidor web i què executa PHP.
2. Seguix l'exemple de petició de reserva: entrada, processament i resposta prevista.
3. Revisa la comparació de tecnologies, l'alternativa descartada i les fonts consultades.
4. Comprova que la decisió separa la base de R1M2 del framework ajornat a R3.

Resultat esperat: poder explicar el flux sense confondre PHP amb el navegador o amb la base de dades.
La defensa oral amb el professorat està pendent.

## Decisions tècniques

- Decisió: començar R1M2 amb PHP base i Apache en Docker.
- Motiu: entendre una petició i una resposta abans d'introduir un framework complet.
- Alternativa descartada ara: NestJS, perquè implicaria canviar la base PHP del curs.
- Ajornat: valorar Laravel en R3, quan el projecte necessite més estructura.
- Dubte pendent: com evitarem dues reserves simultànies del mateix material?

## Registre d'ús d'IA

He usat IA per aclarir la diferència entre servidor web i runtime i comparar opcions.
En [docs/ai-log.md](docs/ai-log.md) he registrat la pregunta literal, el suggeriment,
què he acceptat o modificat i com ho he contrastat amb el material del curs.
La fitxa conté l'explicació aplicada a Material Viu.

## Pròxim pas

En R1M2 muntaré l'entorn i comprovaré una primera landing servida amb PHP.
````

Si no has usat IA, substituïx l'últim apartat per una indicació breu i les fonts que sí has consultat. No inventes preguntes ni converses per omplir el registre.

### Exemple R1M2: entrega executable

Este exemple pressuposa un `compose.yaml` amb serveis `web`, `db` i `phpmyadmin`; web en el port `8115`, phpMyAdmin en `8215`, i MySQL només accessible dins de Docker. En el servei `db`, les variables `MYSQL_USER`, `MYSQL_PASSWORD` i `MYSQL_DATABASE` configuren un usuari local de pràctiques. La portada està en `src/index.php` i el CSS en `src/style.css`. **Les ordres s'han d'adaptar si la teua configuració és diferent.**

````md
# Material Viu — R1M2

Material Viu presenta un servei de reserva de material reutilitzable per a activitats del barri.
Esta versió mostra el producte; encara no permet enviar reserves.

## Microrepte actual

| Camp | Valor |
|---|---|
| Microrepte | R1M2 — Entorn executable, landing inicial i tancament de R1 |
| Què he fet | He configurat PHP/Apache, MySQL i phpMyAdmin i creat una landing pròpia amb CSS. |
| Com provar-ho | Arrancar Docker Compose, obrir la portada i seguir les comprovacions HTTP i SQL indicades més avall. |
| Evidències principals | [Decisions i incidències](docs/r1m2.md), [log de comprovacions](evidence/r1m2/verificacio.txt) i [AI log](docs/ai-log.md). |

La [fitxa de R1M1](docs/r1m1.md) es conserva com a antecedent de la decisió tècnica.

## Requisits

- Docker Engine o Docker Desktop en marxa, amb Docker Compose v2.
- Ports 8115 i 8215 lliures.
- Connexió per descarregar les imatges la primera vegada.
- Executar les ordres des de l'arrel del repositori, on està compose.yaml.

## Com executar-lo

```bash
docker compose up -d --wait --wait-timeout 180
docker compose ps
```

| Servei | Funció | Accés |
|---|---|---|
| web | Apache executa PHP i servix la portada i el CSS | http://127.0.0.1:8115/ |
| db | MySQL, preparat per a fases posteriors | db:3306 dins de la xarxa Docker; sense port publicat al host |
| phpmyadmin | Administració de MySQL | http://127.0.0.1:8215/ |

Per entrar a phpMyAdmin, usa l'usuari local de pràctiques definit en compose.yaml
amb MYSQL_USER i MYSQL_PASSWORD; el servidor MySQL és db.
Les credencials de demostració no són contrasenyes personals ni de producció.

Per parar els serveis conservant el volum de dades:

```bash
docker compose down
```

## Com verificar-lo

### Portada i CSS

```bash
curl -i http://127.0.0.1:8115/
curl -I http://127.0.0.1:8115/style.css
```

Resultat esperat: resposta HTTP 200, HTML amb el nom «Material Viu» i CSS accessible.
Obri també la portada al navegador: ha de mostrar el propòsit, l'estat inicial i el pròxim pas de R2.
L'HTML rebut no ha de contindre codi PHP sense executar.

### Base de dades

```bash
docker compose exec -T db sh -c 'MYSQL_PWD="$MYSQL_PASSWORD" mysql -u"$MYSQL_USER" -D"$MYSQL_DATABASE" -e "SELECT 1 AS connexio, DATABASE() AS base;"'
```

Resultat esperat: connexio igual a 1 i el nom de la base configurada en MYSQL_DATABASE.
La landing encara no consulta MySQL; esta prova comprova la infraestructura per separat.

### phpMyAdmin

Obri http://127.0.0.1:8215/, entra amb l'usuari local indicat i comprova que pots consultar la base de pràctiques.
Carregar la pàgina d'accés i entrar a la base són comprovacions diferents: registra quines has fet.

### Evidències i errors

Guarda les ordres, la data i les eixides reals en [verificacio.txt](evidence/r1m2/verificacio.txt).
Els resultats esperats d'este README no substituïxen eixe log.
Si falla l'arrancada, consulta docker compose ps i docker compose logs,
i registra el missatge, la hipòtesi i el següent intent en [docs/r1m2.md](docs/r1m2.md).

## Decisions tècniques i traçabilitat

- He mantingut PHP sense framework per entendre el flux HTTP; Laravel queda ajornat a R3.
- He adaptat el nom del producte, els textos, els ports i el CSS.
- Apache rep la petició, PHP genera HTML i el navegador interpreta HTML/CSS.
- El registre de tasques d'entorn, portada, documentació i comprovacions està en [docs/r1m2.md](docs/r1m2.md).
- El dubte sobre reserves simultànies continua obert: encara no hi ha persistència del domini.

## Registre d'ús d'IA

En [docs/ai-log.md](docs/ai-log.md) he registrat les consultes reals sobre configuració i CSS,
les propostes adaptades i les comprovacions executades. Els resultats es poden contrastar amb el log.

## Pas a R2

Preparar un formulari de reserva amb material i franja horària, validar-lo en PHP
i conservar els valors quan hi haja errors. Formularis, sessions i login encara no formen part d'esta entrega.

## Ampliació del repte

No presente ampliació de R1. La landing forma part del nucli obligatori.
````

Si presentes l'ampliació, substituïx només eixe últim apartat per una descripció real i un enllaç a `docs/r1-ampliacio.md`, amb les rutes i les proves corresponents. Es recull en R1M2 com a últim microrepte de R1 i queda pendent de validació docent; no cal incloure-la en el README de R1M1. Consulta la [regla d'ampliació del repte](../ampliacions-excellencia.md).

En passar de R1M1 a R1M2, actualitza el README amb l'entrega actual i conserva `docs/r1m1.md`. En entregues posteriors, aplica el mateix criteri amb els codis i les evidències que pertoquen.

