---
layout: default
---
<section>
  <div class="wrap">
    <h2>Contact Us</h2>
    <p>For further information or queries, please contact us through this form.</p>
    <form id="contact-form" action="https://formspree.io/cicognara@googlegroups.com" method="POST">
      <p><input type="text" name="name" placeholder="Name"></p>
      <p><input type="email" name="_replyto" placeholder="Email" required></p>
      <p><textarea name="comment" placeholder="Message" required></textarea></p>
      <p><input id="submit-form" type="submit" value="Send"></p>
      <input type="hidden" name="_subject" value="Message from Cicognara Website" />
      <input type="text" name="_gotcha" style="display:none" />
      <input type="hidden" name="_next" value="/contact" />
    </form>
  </div>
</section>
