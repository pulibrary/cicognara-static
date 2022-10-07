---
layout: default
---
<section class="faq" id="faq">
  <h1>Contributor FAQs</h1>
  <p>Please find FAQs below regarding the contribution guidelines to the Digital Cicognara Library
    and see the <a href="/checklist.html">Metadata Checklist</a> for concise contribution
    information.</p>

  <h2>1. What are the components of the Digital Cicognara Library?</h2>
  <p>The Digital Cicognara Library brings together digital facsimiles of volumes matching the titles
    in the two-volume inventory of Count Leopoldo Cicognara’s (1767–1834) private book collection,
    the <em><a href="/catalogo">Catalogo ragionato dei libri d’arte e d’antichità</a></em> published
    in 1821. The project applies the <a href="https://iiif.io/">International Image Interoperability
    Framework (IIIF)</a> to present the high-resolution color reproductions of matching volumes
    provided by partner libraries. In addition to the digital color facsimiles, which are gradually
    being added to the website, the Digital Cicognara Library also provides the digitized microfiche
    of the original Cicognara volumes.  In the 1980s and 1990s, the Samuel H. Kress Foundation
    sponsored a project to microfiche the original volumes held in the <em>Fondo Cicognara</em> of
    the Biblioteca Apostolica Vaticana. With support from another Kress grant in 2016 all
    microfiche were digitized and thanks to the Vatican Library will be available on the Digital
    Cicognara Library website in open access, making the original volumes in the <em>Fondo
    Cicognara</em> more easily accessible.</p>
  <p>The Digital Cicognara Library draws its metadata from three different sources: (1) The basis
    and foundation of the website is the full text of Cicognara’s <em>Catalogo</em>, which was
    kindly provided to the project by the <a href="http://www.memofonte.it/">Fondazione
    Memofonte</a>. (2) The metadata MARC records for the microfiche and the digitized microfiche
    are regularly updated and kindly provided by the National Gallery of Art Library, Washington.
    (3) The third source of metadata is provided in a IIIF manifest by the contributing institutions
    alongside their high-resolution digital color facsimiles of titles matching those of Cicognara’s
    <em>Catalogo</em>.</p>

  <h2>2. How do I contribute to the Digital Cicognara Library?</h2>
  <p>Contributions to the Digital Cicognara Library website are enabled by the
    <a href="http://portal.getty.edu/">Getty Research Portal</a>. The Getty Research Portal is an
    initiative of the Getty Research Institute, which offers free global access to digitized art
    history texts. The Portal aggregates metadata that links to fully-digitized and downloadable
    texts hosted by the contributing institutions or their service providers. For further
    information, see the <a href="http://portal.getty.edu/faq">Portal’s FAQs page</a> and
    <a href="http://www.getty.edu/research/tools/portal/guidelines.html">guidelines for
    contribution page</a>.</p>
  <p>The records for the matching digitized Cicognara volumes will be provided from the Getty
    Research Portal to the Digital Cicognara Library via JSON-LD. This workflow enables the Digital
    Cicognara Library project to build upon already existing ones and allows all volumes from the
    library to be searched within the larger art historical context as offered by the Portal.</p>
  <p>In order to contribute records for matching digitized volumes to the Digital Cicognara Library,
    please complete the <a href="http://www.getty.edu/research/tools/portal/terms.html">Getty
    Research Portal Contribution Agreement</a>.</p>

  <h2>3. Does the Getty Research Portal or the Digital Cicognara Library ingest the digital
    facsimiles?</h2>
  <p>The technology applied for adding digital facsimiles to the Getty Research Portal and the
    Digital Cicognara Library assures that the control over the data remains with the contributing
    institution. Both portals either link to the presentation or display the digital content stored
    on the contributing institution’s servers via API in a viewer. This also implies that the Getty
    Research Portal and the Digital Cicognara Library rely on the digital content being persistent
    and long term archived.</p>
    
  <h2>4. What are the specifications for digitizing matching Cicognara volumes?</h2>
  <p>The following recommendations have been made by the charter partners for digitizing matching
    Cicognara volumes. Before digitizing please check that each title exactly matches the
    corresponding title in Cicognara’s <em><a href="/catalog">Catalogo ragionato dei libri d’arte e
    d’antichità (1821)</a></em>.  If in doubt, please contact the project team at
    <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a>.</p>
  <p>The digitized object should include the following:</p>
  <ul>
    <li>full text (including blank pages)</li>
    <li>binding (front and back covers)</li>
    <li>spine</li>
    <li>edges</li>
    <li>front and rear pastedowns</li>
    <li>flyleaves</li>
    <li>color chart and scale</li>
  </ul>
  <p>The following technical specifications for digitization are recommended:</p>
  <ul>
    <li>format for original digitization: TIFF or RAW</li>
    <li>format for access copies:  JPEG2000</li>
    <li>resolution: 300 dpi</li>
    <li>color depth: 24-bit color</li>
  </ul>
  <h2>5. What are the requirements for contributing links to digitized texts?</h2>
  <ul>
    <li>Source records must include one or more fully-formed hyperlinks to a high-quality, fully
      digitized text</li>
    <li>The digital facsimile must be freely available open access (e.g. not password-protected or
      IP-dependent) and downloadable</li>
    <li>Ideally, a full-text search should be possible</li>
  </ul>

  <h2>6. What are the source metadata requirements?</h2>
  <p>Contributed records must be in one of the four formats accepted by the Getty Research Portal:
    MARC, MODS, Dublin Core, or CSV (please contact
    <a href="mailto:portal@getty.edu">portal@getty.edu</a> for a specialized Getty CSV) and include
    the following:</p>
  <ul>
   <li>A link to the digital facsimile</li>
   <li>Title</li>
   <li>If in MARC format:
     <ul>
      <li>static unique identifier in 001 field</li>
      <li>please export MARC records in Unicode (UTF8/UTF-8) format</li>
     </ul>
    </li>
    <li>A IIIF manifest</li>
    <li>The Digital Cicognara Library number (DCL#, see below)</li>
    <li>The Cicognara <em>Catalogo</em> number (see below)
      <ul>
        <li>
          The DCL # and Cicognara <em>Catalogo</em> number should also be included in
          the IIIF manifest itself (see below)
        </li>
      </ul>
    </li>
  </ul>
  <p><b>*Please note:</b> If you cannot provide source metadata and/or are unable to meet these
    requirements but are interested in contributing, please contact
    <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a>.</p>

  <h2>7. How can records for digital facsimiles be delivered?</h2>
  <p>Contributions to the Digital Cicognara Library can be made through the Getty Research Portal
    via the following methods of delivery:</p>
  <ul>
    <li>Email attachment</li>
    <li>Open Archives Initiative (OAI) harvest</li>
  </ul>
  <p><b>*Please note:</b> If your institution is not using an OAI-repository, and changes or updates
    its source metadata, please send an updated file to the Getty Research Portal.  </p>

  <h2>8. What is the International Image Interoperability Framework (IIIF)?</h2>
  <p>The Digital Cicognara Library uses the <a href="https://iiif.io/">International Image
    Interoperability Framework</a> to add digital content to its website. This enables contributing
    institutions to maintain the control over their digital files stored on their servers and avoids
    digital content being superfluously duplicated and archived in multiple places. The IIIF
    technology offers the ability to present digital content and its related metadata via API in a
    viewer embedded on the Digital Cicognara Library website, thus providing a coherent and
    homogeneous user experience.  </p>
  <p>In order to display the digital content on the Digital Cicognara Library:</p>
  <ul>
    <li>Contributing institutions should provide a clearly identifiable
    <a href="https://iiif.io/api/presentation/2.1/">IIIF manifest</a> in the source metadata for
    each digital volume. (Please contact the project team at
    <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a> if your institution
    cannot provide a IIIF manifest).  </li>
    <li>The link to the IIIF manifest should be included in one of the four formats accepted by the
    Getty Research Portal, see the following recommendations and examples:</li>
  </ul>

  <table>
    <tr>
      <td>
        <div>MARC</div>
        <div>856 41 $u [Manifest URI]</div>
        <div>$q JSON (IIIF Manifest)</div>
      </td>
      <td>
        <div>MODS</div>
        <div>&lt;relatedItem type="otherFormat"&gt;</div>
          <div>&nbsp;&nbsp;&lt;identifier type="uri"&gt;</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;[Manifest URI]</div>
          <div>&nbsp;&nbsp;&lt;/identifier&gt;</div>
          <div>&lt;/relatedItem&gt;</div>
        </td>
        <td>
          <div class="bold-text">Dublin Core</div>
          <div>&lt;dc:hasFormat&gt;</div>
          <div>&nbsp;&nbsp;[Manifest URI]</div>
          <div>&lt;/dc:hasFormat&gt;</div>
        </td>
        <td>
          <div>CSV</div> IIIF Manifest URL
        </td>
      </tr>
    </table>

  <p><b>*Please note:</b> For any of the above, as these fields may contain other URLs, please
    indicate to portal@getty.edu which are IIIF when contributing records.  </p>
  <p>
    <b>Mets:</b> the IIIF manifest is documented as follows:
    <code>
      <div>&lt;mets:dmdSec ID="dmd__iiif"&gt;</div>
      <div>&lt;mets:mdRef LOCTYPE="URL" MDTYPE="IIIF" xlink:href="https://...."/&gt;</div>
    </code>
    <div>Recommendation to make IIIF URL identifiable: <code>MDTYPE="IIIF"</code></div>
  </p>
  <p>Please find an example for a IIIF manifest in the Digital Cicognara Library project here:
    <a href="https://digi.ub.uni-heidelberg.de/diglit/iiif/junius1694/manifest.json">https://digi.ub.uni-heidelberg.de/diglit/iiif/junius1694/manifest.json</a>.</p>
  <p>Manifests can be checked in the
    <a href="https://iiif.io/api/presentation/validator/service/">IIIF Presentation API
    Validator</a> to determine whether they have been configured correctly according to IIIF
    specifications. The manifest should generate no errors and minimal warnings when run through
    the Validator.</p>

  <h2>9. What information should the IIIF manifest contain?</h2>
  <p>The following metadata should be recorded in the IIIF manifest:</p>
  <ul>
    <li>Digital Cicognara Library number (DCL #, see below)</li>
    <li>Cicognara <em>Catalogo</em> number (see below)</li>
    <li>Author</li>
    <li>Title</li>
    <li>Place of publication</li>
    <li>Publisher</li>
    <li>Year of publication</li>
    <li>Attribution or credit line of holding institution</li>
    <li>Shelf mark of holding institution</li>
    <li>Link to the digitized copy (DOI, URL, URN)</li>
    <li>Link to bibliographic information (further information on the physical description of the
      matching volume) </li>
    <li>Rights statement or link to a rights statement</li>
    <li>Link to OCR full text (if available)</li>
  </ul>

  <h2>10.  What is the Digital Cicognara Library number (DCL #)?</h2>
  <p>The Digital Cicognara Library number (DCL #) is a three-character alphanumeric code that has
    been generated by the project in order to match digitized volumes to the catalog entries in
    Cicognara’s <a href="/catalogo">Catalogo ragionato dei libri d’arte e d’antichità (1821)</a>.
    Please contact <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a> to
    receive a list of all DCL #.  </p>
  <p>The DCL # should be documented in <b>both</b> the source metadata and the IIIF manifest:</p>
  <ul>
    <li>The <b>DCL # should be included in one of the four formats accepted by the Getty Research
    Portal</b>, see the following recommendations and examples (with the place holders “xyz”):</li>
    <table class="table table-bordered">
      <tr>
        <td>
          <div class="bold-text">MARC</div>
          <div>024 8_ $a dcl:xyz</div>
        </td>
        <td>
          <div class="bold-text">MODS</div>
          <div>&lt;mods:identifier type="local"&gt;</div>
          <div>&nbsp;&nbsp;dcl:xyz</div>
          <div>&lt;/mods:identifier&gt;</div>
        </td>
        <td>
          <div class="bold-text">Dublin Core</div>
          <div>&lt;dc:identifier&gt;</div>
          <div>&nbsp;&nbsp;dcl:xyz</div>
          <div>&lt;/dc:identifier&gt;</div>
        </td>
        <td>
          <div class="bold-text">CSV</div>
          DCL Number
        </td>
      </tr>
    </table>

    <li>The <b>DCL # should be documented in the IIIF manifest</b> under the label "local
      identifier."
      <ul>
        <li>Recommendation: <code>{"label":"Local Identifier", "value":["dcl:xyz"]}</code></li>
      </ul>
    </li>
  </ul>

  <h2>11. What is the Cicognara <em>Catalogo</em> number? How should it be documented?</h2>
  <p>In 1821, Leopoldo Cicognara compiled a two-volume inventory for his library with the title
    <em>Catalogo ragionato dei libri d’arte e d’antichità (1821)</em>.  This full text of the
    <em>Catalogo</em> forms the basic structure of the Digital Cicognara Library website. Each
    title in the <em>Catalogo</em> was assigned a sequential number (see
    <a href="/catalog">https://www.cicognara.org/catalogo</a>).  </p>
  <p>The Cicognara <em>Catalogo</em> number, which is the scholarly reference number for each
    volume listed in the library, should be documented in <b>both</b> the source metadata and IIIF
    manifest:</p>
  <ul>
    <li>The <b>Cicognara <em>Catalogo</em> number should be included in one of the four formats
    accepted by the Getty Research Portal,</b> see the following recommendations and examples (with
    the place holders “xyz”):</li>
    <table class="table table-bordered">
      <tr>
        <td>
          <div class="bold-text">MARC</div>
          <div>510 4_ $a Cicognara, $c xyz</div>
        </td>
        <td>
          <div class="bold-text">MODS</div>
          <div>&lt;mods:identifier type="local"&gt;</div>
          <div>&nbsp;&nbsp;Cicognara, xyz</div>
          <div>&lt;/mods:identifier&gt;</div>
        </td>
        <td>
          <div class="bold-text">Dublin Core</div>
          <div>&lt;dc:identifier&gt;</div>
          <div>&nbsp;&nbsp;Cicognara, xyz</div>
          <div>&lt;/dc:identifier&gt;</div>
        </td>
        <td>
          <div class="bold-text">CSV</div>
          Cicognara Number
        </td>
      </tr>
    </table>
    <li>The Cicognara <em>Catalogo</em> number should be documented in the IIIF manifest under the
      label "local identifier."
      <ul>
        <li>Recommendation: <code>{"label":"Local Identifier","value":["Cicognara, xyz"]}</code></li>
      </ul>
    </li>
  </ul>

  <h2>12. Are the MARC records for Digital Cicognara Library available?</h2>
  <p>In collaboration with the National Gallery of Art Library Washington the Digital Cicognara
    Library is regularly updating the MARC records for the microfiche edition of the <em>Fondo
    Cicognara</em> held at the Biblioteca Apostolica Vaticana. The microfiche were filmed in a
    project in the 1980s and 1990s sponsored by the Samuel H. Kress Foundation. All microfiche have
    been digitized as part of the Digital Cicognara Library project and will be available online in
    open access.  </p>
  <p>The National Gallery of Art Library Washington is updating its MARC records on the microfiche
    and displaying them in their <a href="https://library.nga.gov/">local catalog</a>, in
    <a href="http://www.worldcat.org">OCLC</a> as well as the Digital Cicognara website.  </p>
  <p>Should your institution be interested in receiving updated microfiche MARC records please
    contact <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a>.  </p>

  <h2>13. Can structmaps be displayed on the Digital Cicognara Library website?</h2>
  <p>Structmaps have been created for the digital microfiche and are displayed in the IIIF viewer
    on the Digital Cicognara Library website. Should your institution provide or wish to create
    structmaps for your digital facsimiles, please contact
    <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a>.  </p>

  <h2>Contact</h2>
  <p>For further information or questions on the Digital Cicognara Library please contact:
    <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a>.</p>

</section>
