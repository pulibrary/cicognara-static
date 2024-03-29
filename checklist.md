---
layout: default
title: Metadata
---
<h1>Metadata Checklist for Contributing to the Digital Cicognara Library</h1>
<p>If you cannot fulfill all the requirements listed below, please email
  <a href="mailto:cicognara@googlegroups.com">cicognara@googlegroups.com</a> and we will work with you on finding a solution.  If the required fields for source metadata are not in the recommended fields, please email <%= mail_to "portal@getty.edu" %> with the information on where the required fields are located.</p>
<p>For further details on contributions or terminology used below, please also check the
  <a href="faq.html">contributor FAQs page</a>.</p>

<h3>Signed Getty Research Portal Contributor’s Agreement</h3>
<ul>
  <li>Location: <a href="http://www.getty.edu/research/tools/portal/terms.html">http://www.getty.edu/research/tools/portal/terms.html</a></li>
</ul>

<h3>Digital Facsimile</h3>
<ul class="normal-size-text">
  <li>Fully digitized copy of a volume matching an entry in
    <em><a href="/catalogo">Cicognara’s Catalogo ragionato dei libri d’arte e d’antichità (1821)</a></em>.</li>
  <li>Freely available (e.g. not password-protected or IP-dependent)</li>
  <li>Downloadable through contributor’s website</li>
  <li>Full-text searchable, if possible</li>
</ul>

<h3>Source Metadata</h3>
<ul class="normal-size-text">
  <li>In MARC, MODS (can be wrapped in METS), Dublin Core or Getty CSV format</li>
  <li>Source metadata should include the fields listed below:
  <ul>
    <li>A link to the digital facsimile</li>
    <li>Title</li>
    <li>If in MARC format, static unique identifier in 001 field</li>
    <li>A link to the IIIF manifest (see table for recommended field)</li>
    <li>The Digital Cicognara Library number (DCL #, see table for recommended field with place holders “xyz”)</li>
    <li>Cicognara <em>Catalogo</em> number (see table for recommended field with place holders “xyz”)</li>
  </ul></li>
</ul>
<table class="table">
  <thead>
    <th></th>
    <th>MARC</th>
    <th>MODS</th>
    <th>Dublin Core</th>
    <th>CSV</th>
  </thead>
  <tbody>
    <tr>
      <th scope="row">IIIF Manifest</th>
      <td>
        <div>856 41 $u [Manifest URI]</div>
        <div>$q JSON (IIIF Manifest)</div>
        <div>$3 [vol/copy num]</div>
      </td>
      <td>
        <div>&lt;relatedItem type="otherFormat"&gt;</div>
        <div>&nbsp;&nbsp;&lt;identifier type="uri"&gt;</div>
        <div>&nbsp;&nbsp;&nbsp;&nbsp;[Manifest URI]</div>
        <div>&nbsp;&nbsp;&lt;/identifier&gt;</div>
        <div>&lt;/relatedItem&gt;</div>
      </td>
      <td>
        <div>&lt;dc:hasFormat&gt;</div>
        <div>&nbsp;&nbsp;[Manifest URI]</div>
        <div>&lt;/dc:hasFormat&gt;</div>
      </td>
      <td>IIIF Manifest URL</td>
    </tr>
    <tr>
      <th scope="row">DCL Number (DCL#)</th>
      <td>024 8_ $a dcl:xyz</td>
      <td>
        <div>&lt;mods:identifier type="local"&gt;</div>
        <div>&nbsp;&nbsp;dcl:xyz</div>
        <div>&lt;/mods:identifier&gt;</div>
      </td>
      <td>
        <div>&lt;dc:identifier&gt;</div>
        <div>&nbsp;&nbsp;dcl:xyz</div>
        <div>&lt;/dc:identifier&gt;</div>
      </td>
      <td>DCL Number</td>
    </tr>
    <tr>
      <th scope="row">Cicognara <em>Catalogo</em> Number</th>
      <td>510 4_ $a Cicognara, $c xyz</td>
      <td>
        <div>&lt;mods:identifier type="local"&gt;</div>
        <div>&nbsp;&nbsp;Cicognara, xyz</div>
        <div>&lt;/mods:identifier&gt;</div>
      </td>
      <td>
        <div>&lt;dc:identifier&gt;</div>
        <div>&nbsp;&nbsp;Cicognara, xyz</div>
        <div>&lt;/dc:identifier&gt;</div>
      </td>
      <td>Cicognara Number</td>
    </tr>
  </tbody>
</table>

<h3>IIIF Manifest</h3>
<p>Please note: In order to display properly, IIIF manifests must be hosted on servers that
  support https. Fields to include in the <a href="https://iiif.io/">International Image
  Interoperability Framework (IIIF)</a> manifest:</p>
<ul class="normal-size-text">
  <li>Digital Cicognara Library number (DCL #)</li>
  <li>Cicognara <em>Catalogo</em> number</li>
  <li>Author</li>
  <li>Title</li>
  <li>Place of publication</li>
  <li>Year of publication</li>
  <li>Volume or copy information</li>
  <li>Attribution or credit line of holding institution</li>
  <li>Shelf mark of holding institution</li>
  <li>Link to the digitized copy (DOI, URL, URN)</li>
  <li>Link to bibliographic information (further information on the physical description
    of the matching volume)</li>
  <li>Rights statement or link to a rights statement</li>
  <li>Link to OCR full text (if available)</li>
</ul>
<p>Example of a IIIF manifest in the Digital Cicognara Library project:
  <a href="https://digi.ub.uni-heidelberg.de/diglit/iiif/junius1694/manifest.json">https://digi.ub.uni-heidelberg.de/diglit/iiif/junius1694/manifest.json</a></p>
<p>Sample metadata section of a IIIF manifest in the Digital Cicognara Library project:</p>
<pre class="code-block">
"metadata" : [
      {
         "label" : "Author",
         "value" : [
            "Junius, Franciscus; Graevius, Johannes Georgius   [Hrsg.]"
         ]
      },
      {
         "label" : "Location",
         "value" : [
            "Rotterdam"
         ]
      },
      {
         "label" : "Date",
         "value" : [
            "1694"
         ]
      },
      {
         "label" : "Published",
         "value" : [
            "Rotterdam, 1694"
         ]
      },
      {
         "label" : "Identifier (URN)",
         "value" : [
            "&lt;a href='http://nbn-resolving.de/urn:nbn:de:bsz:16-diglit-280404'&gt;urn:nbn:de:bsz:16-diglit-280404&lt;/a&gt;"
         ]
      },
      {
         "label" : "Identifier (DOI)",
         "value" : [
            "&lt;a href='https://doi.org/10.11588/diglit.28040'&gt;10.11588/diglit.28040&lt;/a&gt;"
         ]
      },
      {
         "label" : "Local Identifier",
         "value" : [
            "Cicognara, 148"
         ]
      },
      {
         "label" : "Local Identifier",
         "value" : [
            "dcl:f88"
         ]
      },
      {
         "label" : "Bibliographic Information",
         "value" : [
            "&lt;a href='https://katalog.ub.uni-heidelberg.de/titel/67887612'&gt;View in catalogue&lt;/a&gt;"
         ]
      },
      {
         "label" : "Shelfmark",
         "value" : [
            "C 5936 Folio RES"
         ]
      }
   ],
</pre>

<p>Manifests can be checked in the
  <a href="https://iiif.io/api/presentation/validator/service">IIIF Presentation API
  Validator</a> to determine whether they have been configured correctly according to IIIF
  specifications. The manifest should generate no errors and minimal warnings when run through
  the Validator.</p>

<p>Send source metadata to the Getty Research Portal
  (<a href="mailto:portal@getty.edu">portal@getty.edu</a>) via one of the following methods:</p>
<ul class="normal-size-text">
  <li>Email attachment</li>
  <li>OAI harvest - One-time email with link to OAI which will be harvested quarterly unless asked
    otherwise.</li>
  <li>Please email <a href="mailto:portal@getty.edu">portal@getty.edu</a> if none of the above
    methods are possible and we will work with you on transmitting files.</li>
</ul>
