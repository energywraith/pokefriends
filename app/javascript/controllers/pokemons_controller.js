import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}

  change(event) {
    const frame = document.getElementById("pokemons");
    const url = new URL(window.location.href);

    if (event.target.value) {
      url.searchParams.set("q", event.target.value);
    } else {
      url.searchParams.delete("q");
    }
    window.Turbo.navigator.history.replace(url);

    frame.src = url.toString();
    frame.reload();
  }
}
