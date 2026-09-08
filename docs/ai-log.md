# IA: guia i registre d’ús

Este fitxer reunix les normes, els exemples de preguntes i el teu report breu d’ús d’IA. **Només has d’omplir l’apartat [El meu registre](#el-meu-registre)** i conservar les entrades dels microreptes anteriors. No cal crear un report separat.

La guia i els exemples següents són material de consulta de la plantilla; no són evidències de consultes fetes per tu.

<details>
<summary>Guia: usos permesos, preguntes model i exemples (obri per consultar)</summary>

**La IA pot ajudar-te a comprendre. La implementació de servidor i les proves del repte les has de fer tu.** Esta norma s’aplica als microreptes, al repte complet i a les ampliacions.

## Què està permés i què no

| Situació | Criteri del mòdul |
|---|---|
| Demanar que t’explique teoria, sintaxi o un concepte amb un exemple menut diferent del repte | Permés. Contrasta-ho amb els apunts i comprova que ho entens. |
| Mostrar el teu intent i demanar pistes, preguntes o possibles causes d’un error | Permés. Tu escrius i comproves la correcció. |
| Demanar revisió del teu raonament, alternatives o casos límit que convé provar | Permés. Tu decideixes i escrius les proves. |
| Millorar la redacció d’una explicació pròpia o ordenar l’AI log | Permés, sense inventar decisions, dubtes, proves ni resultats. |
| Generar la presentació HTML/CSS completa | Permés dins dels límits explicats més avall. Cal registrar-ho. |
| Demanar la solució del microrepte, el backend complet o una funcionalitat avaluable ja resolta | No permés, encara que després la lliges o canvies els noms. |
| Demanar un esquelet que ja resolga la lògica avaluable, o generar-la per fragments fins a completar-la | No permés. Dividir la petició no canvia que estàs delegant el treball. |
| Fer que un agent implemente, execute proves i corregisca el projecte fins que funcione | No permés. Tampoc si vas acceptant automàticament cada canvi. |
| Inventar converses, proves, resultats o ocultar ajuda rebuda | No permés. |

La norma depén de **l’ús**, no de la marca de la ferramenta. Un agent de programació en mode autònom no pot fer-te el repte. Un xat convencional tampoc pot donar-te la solució perquè l’entregues. Pots consultar conceptes en una ferramenta que també tinga funcions d’agent, mantenint desactivada la delegació del treball avaluable.

## Primer comprén, després intenta i pregunta

1. **Llig la teoria i l’enunciat.** Identifica el concepte que necessites. Pots demanar una explicació abans de programar; no cal entendre-ho tot a la primera.
2. **Explica amb les teues paraules què ha de passar.** Per exemple: què entra, què ha de comprovar el servidor i quin resultat esperes.
3. **Fes un primer intent propi.** Pot ser codi incomplet, un esquema o una hipòtesi.
4. **Pregunta sobre una dificultat concreta.** Inclou l’intent, el resultat esperat i el resultat observat; demana pistes, no la implementació.
5. **Aplica tu el que has entés i comprova-ho.** Prova casos correctes i d’error. Si continues bloquejat, demana ajuda al professorat.
6. **Registra l’ajuda rellevant.** Anota també què no has entés encara. Un dubte real és informació útil.

## Exemples de preguntes adequades

### Per comprendre la teoria

> Estic aprenent sessions en PHP. Sense resoldre el meu repte, explica’m la diferència entre una sessió i una cookie amb un exemple menut diferent del projecte. Després fes-me dues preguntes per comprovar si ho he entés.

### Per passar de la teoria al problema

> He llegit els apunts de validació. Crec que el servidor ha de comprovar estes tres condicions: […]. Sense escriure’m la solució, ajuda’m a revisar el raonament i indica quin concepte hauria de repassar.

### Per depurar un intent propi

> Este és el meu codi: […]. Amb esta entrada espere […] però obtinc […]. Ja he provat […]. Dona’m una pista per identificar la causa, sense reescriure la funció ni mostrar-me la solució.

### Per pensar les comprovacions

> He implementat esta regla i ja he comprovat […]. Quins altres casos límit hauria de considerar? Explica per què, sense generar el codi de les proves.

### Peticions que no has de fer

- «Ací tens l’enunciat: fes-me tots els fitxers i deixa-ho preparat per entregar.»
- «Implementa el login del meu projecte i escriu els tests.»
- «Executa l’autocorrecció i modifica el codi fins que obtinga la màxima nota.»
- «Inventa’m preguntes i errors per omplir l’AI log.»

Escriure «sense donar-me la solució» no autoritza a usar una resposta que acaba resolent el repte. Si la IA es passa de l’ajuda demanada, no incorpores eixa solució: demana una explicació conceptual o una pista més limitada i deixa constància del que has descartat.

## Excepció: HTML i CSS de presentació

Pots generar amb IA la maquetació, els estils i l’HTML estàtic complet, perquè la presentació visual no és l’objectiu d’este mòdul. Revisa el resultat i identifica en l’AI log els fitxers generats.

En un formulari, **tu has de decidir i entendre** els camps, `name`, `method`, `action` i com els rep el servidor. Una maquetació generada no acredita estos coneixements.

L’excepció no inclou PHP incrustat en HTML, plantilles amb lògica de servidor, escapament de dades, validació, sessions, autenticació, persistència, APIs ni JavaScript que resolga funcionalitat avaluable. Estes parts i la configuració tècnica avaluable continuen sent treball teu.

Exemple de petició permesa:

> Genera només HTML estàtic i CSS per presentar este formulari. Jo he decidit els camps, els seus noms, el mètode i l’acció: […]. No afegisques PHP, JavaScript funcional, validació ni connexions a serveis. La lògica de servidor la faré jo.

## Com omplir l’AI log

Usa **`docs/ai-log.md`**; «AI log» o «ai.log» es referixen a este registre, no a un segon fitxer. No cal copiar tota la conversa ni duplicar-la en un report separat.

Per cada consulta rellevant, registra:

- Data i microrepte, ferramenta utilitzada.
- Dubte i teoria consultada; intent propi abans de preguntar.
- Pregunta principal literal.
- Ajuda rebuda i qualsevol codi generat, indicant si l’has incorporat o descartat.
- Decisió pròpia i fitxer o commit relacionat, si n’hi ha.
- Comprovació real: passos o ordre, dades i resultat observat.
- Dubtes que continuen oberts.

**No és obligatori usar IA i no usar-la no penalitza.** Si el microrepte demana el registre i no l’has usada, escriu «No he utilitzat IA en R?M?» i indica les fonts que sí has consultat, si n’hi ha. No inventes consultes per omplir una plantilla. Una consulta conceptual pot enllaçar els apunts i una explicació pròpia; no necessita un commit de codi fictici.

### Exemple d’entrada (il·lustratiu; no el copies com si fora teu)

```md
## R2M1 — Dubte sobre un camp buit
- Data i ferramenta: [data real i ferramenta usada].
- Teoria consultada: apunts de validació d’entrada.
- Intent propi: havia comprovat que el camp existia, però acceptava només espais.
- Pregunta literal: «El meu formulari accepta un nom amb espais. He comprovat
  que el camp existeix. Quina diferència conceptual hi ha entre existir i
  tindre contingut útil? Dona’m una pista sense escriure la validació.»
- Ajuda rebuda: distingir presència, normalització i contingut.
- Decisió pròpia: he revisat la condició del meu validador; no he copiat codi.
- Evidència: [ruta real del validador].
- Comprovació: camp absent, cadena buida, tres espais i nom vàlid.
  Els tres primers mostren error; el nom vàlid continua el flux.
- Dubte pendent: encara he de revisar els límits de longitud.
```

## Com es comprova la comprensió

El professorat pot demanar-te que expliques una decisió, reproduïsques una prova o faces una modificació menuda sense IA. Un registre ben redactat no demostra autoria per si sol: ha de correspondre al treball real.

Abans d’entregar, comprova que pots explicar i modificar la lògica de servidor, que has executat les proves que declares i que has identificat l’ajuda rebuda, inclosa la generació d’HTML/CSS. Les mateixes regles s’apliquen a les ampliacions 9→10.

</details>

## El meu registre

Si no has usat IA en el microrepte, escriu **«No he utilitzat IA en R?M?»** i indica les fonts consultades, si n’hi ha. No usar IA no penalitza.

Si l’has usada, copia el bloc següent per a cada consulta rellevant i ompli’l amb dades reals. Inclou la generació d’HTML/CSS. No cal copiar tota la conversa. Substituïx els camps buits; no entregues l’exemple de la guia com si fora una consulta teua.

### Consulta — R?M? — Títol breu

- Data i ferramenta:
- Dubte o objectiu:
- Teoria o apunts consultats:
- Intent propi abans de preguntar (codi, esquema o hipòtesi):
- Pregunta principal literal:

```text
[Pregunta real enviada a la IA.]
```

- Ajuda rebuda (indica qualsevol codi generat):
- Què he acceptat i què he descartat:
- Què he decidit i implementat jo:
- Fitxer, commit o apunts relacionats, si correspon:
- Com ho he comprovat (passos o ordre, dades i resultat real):
- Què puc explicar o modificar sense IA:
- Dubtes pendents:
