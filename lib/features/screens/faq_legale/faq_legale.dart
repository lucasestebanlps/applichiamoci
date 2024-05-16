import 'package:applichiamoci/common/widgets/appbar/appbar.dart';
import 'package:applichiamoci/utils/constants/sizes.dart';
import 'package:applichiamoci/utils/constants/text_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqList = [
    FAQItem(
        question:
            'Come posso presentare richiesta di protezione internazionale?',
        answer:
            "La richiesta di protezione internazionale si presenta in Questura – Ufficio Immigrazione – in Viale Oronzo Quarta, nei pressi della stazione dei treni. Per fare la richiesta è sufficiente inviare una pec (posta elettronica certificata) al seguente indirizzo dipps140.00p0@pecps.poliziadistato.it.\n\n"
            "Se non possiedi una casella di posta elettronica certificata, puoi rivolgerti a una Associazione, a uno sportello come Casa Comune o a un avvocato. Potranno inviare la pec per tuo conto.\n\n"
            "Nella richiesta da inviare alla questura, devi indicare per grandi linee i motivi per i quali sei fuggito/a dal tuo Paese e perché non puoi tornare.\n\n"
            "Devi dire se hai già presentato richiesta di protezione internazionale in Italia o in altri Paesi e se conosci l’esito della precedente domanda.\n\n"
            "Devi indicare un recapito dove la questura invierà le comunicazioni inerenti la pratica.\n\n"),
    FAQItem(
        question:
            'Cosa succede dopo la presentazione della domanda di protezione internazionale?',
        answer:
            "Dopo aver ricevuto la istanza di protezione internazionale la questura, convoca il richiedente presso i suoi uffici per il foto segnalamento, inviando un appuntamento al recapito indicato nella domanda.\n\n"
            "Dopo qualche giorno, ci sarà una seconda convocazione per verbalizzare la richiesta di protezione internazionale.\n\n"
            "Ci saranno molte domande sui dati anagrafici, la famiglia, gli studi e il lavoro. Se il richiedente ha problemi di salute o è stato vittima di maltrattamenti o torture, è bene comunicarlo alla persona che compila il modulo della richiesta. Chiederanno anche se si è svolta attività politica o se si fa parte di associazioni o religioni che sono perseguitate nel Paese d’origine. È importante dire la verità su quello che è accaduto.\n\n"
            "Chi ha il passaporto, deve consegnarlo ma la questura rilascerà una copia dello stesso..\n\n"),
    FAQItem(
        question: 'Il richiedente asilo quando può iniziare a lavorare?',
        answer:
            'Una volta che il richiedente ha compilato il Modello C3, riceve un attestato di identità che sostituisce momentaneamente il permesso di soggiorno per richiesta asilo.\n\n'
            'Dopo 60 giorni può iniziare a lavorare.'),
    FAQItem(
        question: 'Quanto dura il permesso di soggiorno per richiesta asilo?',
        answer:
            " Dura 6 mesi e viene rinnovato di volta in volta fino a che la sua domanda di asilo verrà accettata o al contrario rigettata.\n\n"
            "Si può rinnovare il permesso per richiesta asilo anche dopo il rigetto della commissione territoriale se si presenta ricorso in tribunale.\n\n"
            "Grazie al permesso in questione è possibile iscriversi subito al Servizio Sanitario Nazionale e scegliere il medico curante.\n\n"),
    FAQItem(
        question: 'Quando e come si può presentare richiesta di cittadinanza?',
        answer:
            "Dopo 10 anni di residenza in Italia si può richiedere la cittadinanza italiana.\n\n"
            "Occorre essere iscritti all’anagrafe da almeno dieci anni e avere il permesso di soggiorno.\n\n"
            "Oltre al requisito della residenza, si deve avere un reddito di almeno €.8.000,00, negli ultimi tre anni.\n\n"
            "La domanda si presenta attraverso il proprio SPID, da richiedere tramite un patronato, alle Poste ovvero online.\n\n"
            "Servono i seguenti documenti:\n\n"
            "- Marca da bollo da €.16\n\n"
            "- Atto di nascita, tradotto e legalizzato dall’ambasciata italiana nel tuo Paese\n\n"
            "- Certificato penale del tuo Paese, tradotto e legalizzato come quello di nascita\n\n"
            "- Fotocopia del passaporto\n\n"
            "- Fotocopia della carta di identità\n\n"
            "- Fotocopia del permesso di soggiorno\n\n"
            "- Certificati storici di residenza di Italia\n\n"
            "- Autocertificazione stato di famiglia in Italia\n\n"
            "- Autocertificazione riguardante le certificazioni penali in Italia (se hai avuto condanne o hai processi in piedi\n\n"
            "- Modello CU, Unico o Modello 730\n\n"
            "- Attestato di conoscenza della lingua italiana a livello non inferiore a B1, rilasciata da un istituto scolastico pubblico o parificato da un ente certificatore"),
    FAQItem(
        question: "Quanto dura un permesso di soggiorno per motivi di lavoro?",
        answer:
            "Il permesso di soggiorno per motivi di lavoro è rilasciato a seguito della stipula del contratto di soggiorno e la sua durata non può superare:\n\n"
            "a) 9 mesi in caso di uno o più contratti di lavoro stagionale;\n\n"
            "b) 1 anno  in caso di lavoro subordinato a tempo determinato\n\n"
            "c) 2 anni in caso di contratto di lavoro subordinato a tempo indeterminato,\n\n"
            "d) 2 anni in caso di lavoro autonomo\n\n"
            "Con il DL 20/23 (CD Decreto Cutro), chi rinnova il permesso di soggiorno per motivi di lavoro autonomo, lavoro subordinato a tempo indeterminato e per famiglia può ottenere un permesso della durata di tre anni. Al termine del primo rinnovo, essendo maturati  cinque anni di soggiorno regolare in Italia,  sarà così possibile, in presenza degli altri requisiti previsti dalla legge, chiedere direttamente il rilascio di un permesso di soggiorno Ue per lungo soggiornanti."),
    FAQItem(
        question:
            "Quanto dura un permesso di soggiorno per motivi di famiglia?",
        answer:
            "I permessi di soggiorno rilasciati a seguito di ricongiungimento familiare hanno una durata massima di 2 anni, però al momento del rinnovo si potrà ottenere un permesso per tre anni a seguito della modifica prevista con il DL 20/23 (CD Decreto Cutro).\n\n"
            "Al termine del primo rinnovo, essendo maturati  cinque anni di soggiorno regolare in Italia,  sarà così possibile, in presenza degli altri requisiti previsti dalla legge, chiedere direttamente il rilascio di un permesso di soggiorno Ue per lungo soggiornanti."),
    FAQItem(
        question:
            "Quali permessi/carte di soggiorno/documenti di viaggio si presentano prendendo appuntamento direttamente allo Sportello dell’Ufficio Immigrazione e non con kit postale?",
        answer:
            "Asilo riconosciuto / Protezione sussidiaria / status apolide (solo prima richiesta dopo il riconoscimento);\n\n"
            "Assistenza minori (riconosciuta dal Tribunale dei minori);\n\n"
            "Casi speciali - ex motivi umanitari - protezione speciale  comprese le richieste di conversione;\n\n"
            "Carta di soggiorno e permesso di soggiorno per i familiari del cittadino comunitario/italiano;\n\n"
            "Cure mediche (con visto d’ingresso);\n\n"
            "Cure mediche (gravidanza/parto, gravissime patologie);\n\n"
            "Documenti di viaggio;\n\n"
            "Emergenza Ucraina - proroga dei permessi di soggiorno rilasciati per protezione temporanea e possibilità di conversione a lavoro;\n\n"
            "Soggiorni di breve durata per turismo/affari/studio/missione/gara sportiva/ricerca scientifica;\n\n"
            "Minori non accompagnati, in affidamento o sotto tutela e successiva conversione al compimento dei 18 anni;\n\n"
            "Richiedenti asilo e ricorrenti (ancora in attesa dell'esito della Commissione territoriale o del ricorso);\n\n"
            "Vacanze lavoro (solo per gli stranieri provenienti da Paesi con specifico accordo con lo Stato Italiano);\n\n"
            "Vidimazione elenchi degli studenti stranieri partecipanti a gite scolastiche nell’Unione Europea."),
    FAQItem(
        question:
            "Quali permessi / carte di soggiorno si richiedono compilando l’apposito kit da inviare tramite gli Uffici Postali con il logo “sportello amico”?",
        answer: "Rinnovo asilo riconosciuto o status apolide riconosciuto\n\n"
            "Attesa riacquisto cittadinanza\n\n"
            "Conversione permesso di soggiorno (per le tipologie ammesse)\n\n"
            "Famiglia\n\n"
            "Lavoro Autonomo / Lavoro Subordinato / Attesa occupazione\n\n"
            "Missione\n\n"
            "Motivi Religiosi\n\n"
            "Permesso di soggiorno CE di lungo periodo\n\n"
            "Residenza elettiva\n\n"
            "Studio (oltre 90 gg.) / ricerca scientifica / tirocinio formazione professionale\n\n"
            "Si richiedono con kit postale anche i duplicati e aggiornamenti di permessi di soggiorno della presente lista.\n\n"
            "Dopo aver compilato il kit ci si presenta all’ufficio postale con la busta ancora aperta."),
    FAQItem(
        question: 'Quali sono i PDS che consentono di lavorare?',
        answer:
            "permesso di soggiorno per studio (con visto - limite 20 ore settimanali)\n\n"
            "permesso di soggiorno per studio (da permesso per motivi familiari - tempo pieno)\n\n"
            "permesso per assistenza minori ex art. 31\n\n"
            "richiesta asilo (decorsi 60 giorni dalla presentazione della domanda di protezione internazionale)\n\n"
            "permesso per integrazione minore\n\n"
            "permesso per residenza elettiva (senza visto: familiare di cittadino comunitario o percettore di rendita Inail - Inps)\n\n"
            "permesso di soggiorno UE per soggiornanti di lungo periodo (ex carta di soggiorno)\n\n"
            "carta di soggiorno come familiare di cittadino dell'Unione Europea;\n\n"
            "permesso di soggiorno per calamità\n\n"
            "permesso di soggiorno per atti di particolare valore civile\n\n"
            "permesso di soggiorno per casi speciali\n\n"
            "permesso di soggiorno per cure mediche.\n\n"),
    FAQItem(
        question:
            "Quali sono i permessi di soggiorno che non consentono di lavorare?",
        answer:
            "Per poter lavorare in Italia il cittadino straniero non comunitario deve essere in possesso del permesso di soggiorno che abilita al lavoro. I permessi di soggiorno che in ogni caso non abilitano al lavoro sono i permessi di soggiorno rilasciati per motivi di turismo, affari o giustizia."),
    FAQItem(
        question:
            'Come si chiede il permesso di soggiorno UE per soggiornanti di lungo periodo (carta di soggiorno)?',
        answer:
            "Il permesso di soggiorno UE per soggiornanti di lungo periodo può essere richiesto solo da chi possiede un permesso di soggiorno in corso di validità da almeno 5 anni.\n\n"
            "La domanda va presentata presso gli uffici postali oppure, senza utilizzare il kit, ci si può recare presso i Comuni che offrono questo servizio o presso i Patronati.\n\n"
            "Alla domanda è necessario allegare:\n\n"
            "- Copia del passaporto o documento equipollente, in corso di validità;\n\n"
            "- Copia della dichiarazione dei redditi (il reddito deve essere superiore all'importo annuo dell'assegno sociale, cioè per il 2024 €.6.542,51); per i collaboratori domestici (colf/badanti): esibizione dei bollettini INPS o estratto contributivo analitico rilasciato dall'INPS;\n\n"
            "- Certificato casellario giudiziale e certificato delle iscrizioni relative ai procedimenti penali;\n\n"
            "- Un alloggio idoneo documentato se la domanda è presentata anche per i familiari;\n\n"
            "- Copie delle buste paga relative all’anno in corso;\n\n"
            "- Documentazione relativa alla residenza e allo stato di famiglia;\n\n"
            "- Bollettino postale di pagamento del permesso di soggiorno elettronico (€30,46);\n\n"
            "- Bollettino postale di €.100,00 da esibire al momento di convocazione in questura;\n\n"
            "- Marca da bollo da €16,00.\n\n"
            "Il permesso di soggiorno UE non può essere rilasciato a chi è pericoloso per l'ordine pubblico e la sicurezza dello Stato.\n\n"
            "La richiesta può essere presentata anche per il coniuge non legalmente separato e di età non inferiore ai diciotto anni, per i figli minori, anche del coniuge o nati fuori dal matrimonio, per i figli maggiorenni a carico che non possano permanentemente provvedere alle proprie indispensabili esigenze di vita in ragione del loro stato di salute che comporti invalidità totale; genitori a carico. In questi casi il reddito deve essere di €.9.813,76 per richiedente + un familiare; €.13.085,02 per il richiedente + due familiari; €.16.356,27 per il richiedente + tre familiari; €.19.627,53 per il richiedente + 4 familiari.\n\n"
            "In questo caso occorre anche avere la certificazione anagrafica che attesti il rapporto familiare. La documentazione proveniente dall'estero dovrà essere tradotta, legalizzata e validata dall'autorità consolare nel Paese di appartenenza o di stabile residenza dello straniero.\n\n"
            "Per la richiesta del permesso UE di lungo soggiorno è necessario anche dimostrare la conoscenza della lingua italiana con:\n\n"
            "- Attestato A2,\n\n"
            "- Titoli di studio (diploma di scuola secondaria italiana di primo o secondo grado, oppure certificati di frequenza relativi a corsi universitari, master o dottorati);\n\n"
            "- Superamento di un test di conoscenza della lingua italiana.\n\n"
            "Non è necessario dimostrare la conoscenza della lingua in presenza di:\n\n"
            "- Attestazione che l'ingresso in Italia è avvenuto ai sensi dell'art. 27, co. 1 lett. a), c), d), q) del decreto legislativo 286/98 e successive modificazioni;\n\n"
            "- Certificazione, rilasciata da una struttura sanitaria pubblica, nella quale sia dichiarato che lo straniero è affetto da gravi limitazioni alla capacità di apprendimento linguistico derivanti dall'età, da patologie o handicap."),
    FAQItem(
        question:
            'Cosa si può fare con il permesso di soggiorno UE di lungo periodo?',
        answer: "Con il permesso di soggiorno UE è possibile:\n\n"
            "- Entrare in Italia senza visto;\n\n"
            "- Circolare liberamente nel territorio dello Spazio Schengen per 90 giorni, per turismo;\n\n"
            "- Svolgere un'attività lavorativa subordinata o autonoma, salvo quelle che la legge espressamente riserva al cittadino italiano o vietate allo straniero;\n\n"
            "- Soggiornare, anche per motivi di lavoro, in un altro Stato Schengen, anche per un periodo superiore ai 90 giorni, nel rispetto comunque della norma in vigore nell'altro Paese membro;\n\n"
            "- Usufruire, sempre che sia dimostrata l'effettiva residenza dello straniero nel territorio nazionale, delle prestazioni di assistenza sociale, di previdenza sociale, di quelle relative ad erogazioni in materia sanitaria, scolastica e sociale, di quelle relative all'accesso a beni e servizi a disposizione del pubblico, compreso l'accesso alla procedura per l'ottenimento di alloggi di edilizia residenziale pubblica, salvo che sia diversamente disposto;\n\n"
            "- Partecipare alla vita pubblica locale, con le forme e nei limiti previsti dalla vigente normativa;\n\n"
            "- Usufruire dei servizi e delle prestazioni erogate dalla pubblica amministrazione;\n\n"
            "Lo straniero titolare di un permesso di soggiorno UE, rilasciato da altro Stato membro, può rimanere in Italia oltre i 3 mesi, per:\n\n"
            "- Esercitare un'attività economica come lavoratore regolare;\n\n"
            "- Frequentare corsi di studio o di formazione professionale;\n\n"
            "- Soggiornare, dimostrando di avere sufficienti mezzi di sostentamento (reddito superiore al doppio dell'importo minimo previsto per l'esenzione della spesa sanitaria) e stipulando un'assicurazione sanitaria per l'intero periodo del soggiorno. In questo caso lo straniero titolare ottiene un permesso di soggiorno rinnovabile alla scadenza, mentre ai familiari verrà rilasciato un permesso di soggiorno per motivi di famiglia."),
  ];

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        title: Text('FAQ ${tr(LocaleKeys.legal)}'),
        showBackArrow: true,
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return FAQItemWidget(faqItem: faqList[index]);
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQItemWidget extends StatelessWidget {
  final FAQItem faqItem;

  const FAQItemWidget({super.key, required this.faqItem});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title:
          Text(faqItem.question, style: Theme.of(context).textTheme.titleLarge),
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: LSizes.md, vertical: LSizes.sm),
            child: Text(faqItem.answer,
                style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}
