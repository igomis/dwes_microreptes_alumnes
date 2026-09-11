# Repositori, branques i entrega del treball

Abans de començar, consulta la [guia d’ús de la IA](guia-ia.md): què està
permés, com demanar pistes i com registrar l’ajuda real en
[`ai-log.md`](ai-log.md).


Esta és la guia única per accedir al repositori, treballar amb branques, preparar evidències, integrar l’entrega i consultar la correcció. La branca ordinària de correcció és **`main`**. Treballarem amb `main` i una branca per microrepte (el treball diari). Cada branca s’integra directament en `main` amb Git, sense pull requests ni etiquetes en el procediment habitual.

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

En R1S1, treballa en `microrepte/r1m1`, actualitza el README i la fitxa inicial, fes commit i push i integra la branca directament en `main` com s’explica més avall. Així el primer treball queda integrat en `main` per a la correcció.

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

El `README.md` de l’arrel descriu l’entrega actual: codi del microrepte, què has fet, com executar-ho, com provar-ho i enllaços a les evidències. Pot substituir la descripció del microrepte anterior, perquè la branca del microrepte en conserva la versió. Si necessites una explicació anterior dins de la versió actual, guarda-la en `docs/r2m1.md` o un fitxer equivalent.

`ENTREGA.md` i els README de carpeta són instruccions de la plantilla; no cal reescriure’ls en cada entrega. Els fitxers de treball han de ser localitzables, per exemple `docs/r2m1.md` i `evidence/r2m1/`. Registra només l’ús real d’IA i les comprovacions que has fet.

Abans del commit, revisa que no falten fitxers necessaris, que les ordres del README funcionen i que no has inclòs secrets, dades personals innecessàries ni fitxers temporals. Tens [dos exemples de README omplits](#exemples-de-readme-omplits) al final d’esta guia.

## El flux de treball

```text
main → crear microrepte/r1m1 → treballar → integrar en main
main → crear microrepte/r1m2 → treballar → integrar en main
```

`main` conté el treball que es corregix. La branca del microrepte conté el treball d’aquell dia i es conserva després d’integrar-la. No creem una branca per repte. Les sessions sense microrepte propi, com R2S0, no necessiten una branca d’entrega.

## 1. Començar un microrepte

Des de la carpeta del repositori, amb els canvis anteriors guardats:

```bash
git switch main
git pull --ff-only origin main
git switch -c microrepte/r1m1
```

Canvia `r1m1` pel microrepte del dia. La branca nova naix de `main` actualitzada, de manera que incorpora també els resultats que haja pujat el corrector. Si ja tens la branca local i només estàs reprenent la feina, usa `git switch microrepte/r1m1`, sense `-c`.

## 2. Treballar, guardar i pujar la branca

Escriu el codi o documentació del microrepte, actualitza el README i comprova el resultat. Després:

```bash
git status
git add README.md
# Afig també els fitxers de codi i evidències que hages modificat.
git diff --cached
git commit -m "R1M1: treball i comprovacions"
git push -u origin microrepte/r1m1
```

`git add README.md` només prepara eixe fitxer: has d’afegir també la resta de fitxers necessaris pel seu nom. Revisa `git diff --cached` abans del commit. Pots repetir commits durant la sessió; després del primer push amb `-u`, en eixa branca basta `git push`.

Pujar la branca guarda el treball en GitHub, però encara falta integrar-lo en `main` perquè es puga corregir.

## 3. Entregar: integrar en main

Amb tot guardat en commits, executa estes quatre ordres **una a una**:

```bash
git switch main
git pull --ff-only origin main
git merge --no-edit microrepte/r1m1
git push origin main
```

`git merge` incorpora el treball de la branca en `main`. `--no-edit` evita obrir un editor per al missatge del merge quan Git necessita crear-lo. Normalment la integració és directa. No has de crear una PR ni acceptar-la en GitHub.

Si una ordre dona error o apareix un conflicte, para abans de continuar amb la següent. En acabar, comprova en GitHub, seleccionant `main`, que el README i les evidències són els del microrepte entregat. Repetix la comprovació bàsica d’execució sobre esta versió integrada.

## 4. Continuar l’endemà

Conserva `microrepte/r1m1` localment i en GitHub; no la reutilitzes per al treball següent. Per començar R1M2:

```bash
git switch main
git pull --ff-only origin main
git switch -c microrepte/r1m2
```

En acabar, repetix els passos de commit, push i merge substituint el nom de branca. El procediment és el mateix quan canvies de repte: per a R2M1 crea `microrepte/r2m1` des de `main` actualitzada.

## Consultar un microrepte anterior

En GitHub, usa el selector de branques per obrir `microrepte/r1m1` i consultar el codi i el README d’aquell moment. La branca es conserva justament per això.

Per llegir un README anterior des del terminal sense canviar de branca:

```bash
git fetch origin
git show origin/microrepte/r1m1:README.md
```

No cal restaurar `main` ni tornar a entregar el microrepte. Els microreptes són treball d’aula sense recuperació individual; la recuperació correspon al repte complet i es coordina amb el professorat.

## Si alguna cosa falla

| Situació | Què fer |
|---|---|
| No pots veure o clonar el repositori | Comprova invitació acceptada, usuari i URL assignada. |
| La branca ja existix | Per reprendre-la, usa `git switch` sense `-c`. |
| Git no permet canviar de branca | Revisa `git status` i guarda els canvis de la feina actual. |
| `git pull --ff-only` no pot avançar | Para i demana ajuda; no descartes canvis per forçar-lo. |
| Conflicte durant el merge | No faces push encara. Resol-lo amb ajuda o cancel·la el merge amb `git merge --abort`. |
| Push rebutjat perquè main ha avançat | En main, fes `git fetch origin` i `git merge --no-edit origin/main`; si no hi ha conflictes, comprova el resultat i torna a fer push. |
| Push rebutjat per permisos o protecció | Consulta el professorat perquè revise la configuració del repositori. |

Per resoldre un conflicte amb ajuda: revisa els fitxers que indica `git status`, tria el contingut correcte, elimina els marcadors, afegix els fitxers resolts amb `git add`, completa amb `git commit --no-edit`, comprova el resultat i fes push. No uses `push --force` ni esborres treball per evitar un conflicte.

## Resultat de l’autocorrecció

La correcció es llança des del repositori central del professorat. No has d’esperar un workflow propi en Actions del teu repositori després de cada push: la plantilla no el necessita. El professorat selecciona el microrepte; el nom de la branca no el selecciona.

Quan es publique el resultat, consulta `autograde/latest.md` en el teu repositori. És el resum llegible amb valoració i comentaris. `autograde/latest.json` conté les dades estructurades i `autograde/history/`, si hi ha resultats anteriors, en conserva l’historial. L’absència de resultat nou no significa per si sola que el push haja fallat.

## Checklist final

- [ ] He acceptat la invitació i clonat el repositori assignat.
- [ ] He treballat en la branca del microrepte i actualitzat el README.
- [ ] He comprovat codi, documentació i evidències, sense secrets ni temporals.
- [ ] He fet commit i push de la branca del microrepte.
- [ ] He integrat la branca en main i fet push de main.
- [ ] He comprovat l’entrega en main i conservat la branca del microrepte.

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
