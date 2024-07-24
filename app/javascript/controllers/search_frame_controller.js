import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}

  change(event) {
    const frame = document.getElementById("search_frame");
    const countFrame = document.getElementById("search_count_frame");
    const url = new URL(window.location.href);

    if (event.target.value) {
      url.searchParams.set("q", event.target.value);
    } else {
      url.searchParams.delete("q");
    }
    window.Turbo.navigator.history.replace(url);

    if (countFrame) {
      countFrame.src = url.toString();
      countFrame.reload();
    }

    frame.src = url.toString();
    frame.reload();
  }
}
