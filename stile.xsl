<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="yes" /> <!-- Metodo di output -->
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" /> <!-- Restituisce il contenuto del nodo selezionato secondo l’espressione XPath indicata. L'attributo "select": espressione XPath da valutare nel contesto corrente. -->

					<!-- In questo caso vado a prendere il contenuto dei nodi selezionati nell'XML (teiCorpus, teiHeader... fino ad arrivare al nodo in cui sono, quindi <title>) e applicare le regole descritte nell'XML a <title> nell'XSL. In questo caso il <title> a cui mi riferisco è posizionato nello <head> -->
				</title>
				<meta charset="UTF-8" />
				<link rel="stylesheet" type="text/css" href="stilecartoline2.css" /> 
				<!-- collego il folgio di stile CSS-->
			</head>

			<body>
				<div class="header">
					<h1 class="mainTitle">
						<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
						<!-- In questo caso il <title> a cui mi riferisco è posizionato in <body> <h1> -->
					</h1>
                </div>

                <p id="selezione">Menù</p>
                <div class="elenco">
                	<a href="cartolina220.html" class="menucartolina" id="c220">
                		<xsl:value-of select="//tei:TEI[@xml:id='cart220']//tei:sourceDesc/tei:bibl/tei:title" />
                		<!-- Qui vado a prendere la cartolina con id 'cart220' nel file XML, scendo fino a selezionare il titolo di quella cartolina. Faccio la stessa cosa con le altre due cartoline-->
                	</a>
                	<a href="cartolina173.html" class="menucartolina" id="c173">
                		<xsl:value-of select="//tei:TEI[@xml:id='cart173']//tei:sourceDesc/tei:bibl/tei:title" />
                	</a>
                	<a href="cartolina163.html" class="menucartolina" id="c163">
                		<xsl:value-of select="//tei:TEI[@xml:id='cart163']//tei:sourceDesc/tei:bibl/tei:title" />
                	</a>
                </div>

                <div id="contenitore220" class="contenitori">
                	<xsl:apply-templates select="//tei:TEI[@xml:id='cart220']" />
                	<!-- (apply-templates) definisce una regola (ovvero un modello) di trasformazione per i nodi di un particolare tipo/contesto & specificano una regola con pattern-matching. 
                	L'attributo "select": indica l'espressione XPath da valutare nel contesto corrente. -->
                </div>
                <div id="contenitore173" class="contenitori">
                	<xsl:apply-templates select="//tei:TEI[@xml:id='cart173']" />
                </div>
                <div id="contenitore163" class="contenitori">
                	<xsl:apply-templates select="//tei:TEI[@xml:id='cart163']" />
                </div>

                <div class="descrizione_progetto">
                	<p>
                		All'interno di questo progetto sono riportate le codifiche in formato digitale di tre cartoline redatte durante la Prima Guerra Mondiale, le quali si trovano attualmente 
                		<xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository" />,  <!-- In questo caso restituisce il nome del luogo in cui sono conservate, presente nel file XML e cioè: "<repository>Museo Civico Etnografico "Giovanni Podenzana", Sezione dei cimeli garibaldini e della Prima Guerra Mondiale</repository>" --> nella città di 
                		<xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement" />. <!-- In questo caso restituisce il nome della città in cui sono conservate, presente nel file XML e cioè: "<settlement type="city">La Spezia</settlement>" -->
                		<br />
                		<br />
                		Lo scambio di queste cartoline avvenne tra Olivia Turtura e Giovanni Coliola.
                	</p>
                </div>

                <div class="footer">
                	<div class="infoFooter" id="about">
                		<h2>About</h2>
                		<p>
                			Il progetto è stato realizzato per il l'esame di Codifica dei Testi (2022/2023), del corso di Informatica Umanistica
                			<br />
                			<xsl:value-of select="//tei:respStmt[1]" />. 
                			<!-- In questo caso mi restituisce quello che è presente all'interno del primo respStmt in XML e cioè: 
                			<resp>Trascrizione digitale a cura di:</resp>
                			<name ref="#MCB">Maria Chiara Bertagni</name>,
					        <name ref="#CT">Claudio Tamburini</name> e
					        <name ref="#AT">Aurora Toti</name> -->
					        <br />
					    </p>
					</div>

					<div class="infoFooter" id="moreInfo">
						<h2>More Information</h2>
						<p>
							Cartoline ubicate presso:
							<xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:repository" /> nella città di 
							<xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement" />.
							<br />
							<xsl:value-of select="//tei:editionStmt/tei:respStmt[2]" />
							<!-- In questo caso mi restituisce quello che è presente all'interno del secondo respStmt in XML e cioè:
						    <resp>Ente di appartenenza:</resp>
					        <name type="#comune" xml:id="SP">Comune di La Spezia</name>  -->
						</p>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>


		<!-- Creazione dei template per il fronte e il retro delle cartoline -->
		<xsl:template match="//tei:TEI[@xml:id='cart220' or @xml:id='cart173' or @xml:id='cart163']">
			<!-- indicando (//tei) voglio selezionare tutti i nodi <tei> a qualsiasi livello i quali hanno come id='cart220' - 'cart173' - 'cart163' -->
			<h3 class="titolocart">
				<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title" />
				<!--  Restituisce il contenuto del nodo selezionato secondo l’espressione XPath indicata. In questo caso il contenuto del nodo <title> all'interno di teiHeader -> fileDesce ecc...
				Quindi mi restituirà "Donna con cane" -->
			</h3>

			<!-- Restituisce le informazioni per il fronte delle cartoline -->
			<div class="infoCartolina">
				<xsl:apply-templates select="tei:facsimile//*[@xml:id='fronte220' or @xml:id='fronte173' or @xml:id='fronte163']/tei:graphic" />
				<!-- Qui vado a selezionare il nodo <graphic> di una delle cartolina (or) -->
				<div class="boxInfo" id="infoFronte">
					<p>
						<strong>Dimensioni: </strong>
						<xsl:value-of select="tei:teiHeader//tei:supportDesc/tei:support/tei:dimensions/tei:height" /><!-- Qui vado a prendere l'altezza della cartolina e la x dopo sta per "altezza x larghezza" -->x
						<xsl:value-of select="tei:teiHeader//tei:supportDesc/tei:support/tei:dimensions/tei:width" />cm.
					</p>

					<p>
						<strong>Stato: </strong> 

						<xsl:value-of select="tei:teiHeader//tei:supportDesc/tei:condition" />
						<!-- Qui vado a fafe la stessa cosa di prima con le dimensioni, andando a prendere lo stato in cui si trova la cartolina, dall'XML, "buono" -->
					</p>

					<p>
						<strong>Lingue: </strong>
						<xsl:for-each select="tei:teiHeader/tei:profileDesc/tei:langUsage/tei:language">
							<xsl:value-of select="." />
							<!-- value-of select = estrae il valore di un elemento XML. Quindi vado ad estrarre ogni lingua presente nel testo, in questo caso restituirà solamente "italiano". -->
						</xsl:for-each>
					</p>

					<p>
						<strong>Mittente: </strong>
						<xsl:value-of select="tei:teiHeader//*[@type='sent']/tei:persName" />
						<!-- Restituisce il nome del mittente. -->
					</p>

					<p>
						<strong>Destinatario: </strong>
						<xsl:value-of select="tei:teiHeader//*[@type='received']/tei:persName" />
						<!-- Restituisce il nome del destinatario. -->
					</p>

					<p>
						<strong>Data: </strong>
						<xsl:value-of select="tei:teiHeader//*[@type='sent']/tei:date" />
					</p>
				</div>

				<!-- Restituisce le informazioni per il retro delle cartoline -->
				<xsl:apply-templates select="tei:facsimile//*[@xml:id='retro220' or @xml:id='retro173' or @xml:id='retro163']/tei:graphic" />
				<div class="boxInfo" id="infoRetro">
					<p>
						<i>
							<xsl:value-of select="tei:text//*[@type='postmark']/tei:mentioned/tei:note" />
						</i>
					</p>
					<p>
						<i>
							<xsl:value-of select="tei:text//*[@type='postage_stamp']/tei:note" />
						</i>
					</p>
					<div class="divTesto">
						<xsl:apply-templates select="tei:text//*[@type='Message']" />
						<!-- Vado a prendere quello che è scritto sul retro della cartolina. -->
					</div>
					<br />
					<div class="elemTipo">
						<p>
							<strong>Elementi tipografici</strong>: 
							<xsl:value-of select="tei:text//*[@type='codStampa']/tei:p" />
							<br />
							<xsl:apply-templates select="tei:text//*[@type='stampe_cartolina']/tei:ab" />
						</p>
					</div>
				</div>
			</div>
		</xsl:template>

		<!-- Immagine cartoline -->
		<!-- FRONTE Immagine-->
		<xsl:template match="tei:facsimile//*[@xml:id='fronte220' or @xml:id='fronte173' or @xml:id='fronte163']/tei:graphic">
			<div class="boxInfo">
                <img src="{@url}" class="sizeFoto" />
			</div>
		</xsl:template>

		<!-- RETRO Immagine-->
		<xsl:template match="tei:facsimile//*[@xml:id='retro220' or @xml:id='retro173' or @xml:id='retro163']/tei:graphic">
			<div class="boxInfo">
				<img src="{@url}" class="sizeFoto" />
			</div>
		</xsl:template>


		<!-- RETRO Testo -->
		<xsl:template match="tei:text//*[@type='Message']">
			<div class="testoretro">
				<p>
					<xsl:apply-templates />
					<!-- L'elemento <xsl:apply-templates> applica un modello all'elemento corrente o ai nodi figlio dell'elemento corrente. -->
				</p>
			</div>
		</xsl:template>
		
		<xsl:template match="tei:lb">
			<!-- (inizio di riga(lb)) segna l'inizio di una nuova riga (tipografica) in qualche edizione o versione di un testo -->
			<br />
		</xsl:template>

		<xsl:template match="tei:text//*[@type='stampe_cartolina']/tei:ab">
			<!-- (blocco anonimo (ab)) contiene una qualsiasi unità testuale a livello di componente che funge da contenitore anonimo di sintagmi o elementi interlivello simili al paragrafo ma senza il bagaglio semantico di quest'ultimo -->
			<xsl:apply-templates />
		</xsl:template>

		<xsl:template match="tei:choice">
			<xsl:value-of select="tei:abbr" />
		</xsl:template>
</xsl:stylesheet>