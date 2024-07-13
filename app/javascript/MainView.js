import EmblaCarousel from "embla-carousel";

(function initRecentAdoptablePokemonCarousel() {
  document.addEventListener("turbo:load", () => {
    const emblaNode = document.querySelector("#recentAdoptablePokemon.embla");
    if (!emblaNode) return;

    const options = { loop: false, dragFree: true };
    EmblaCarousel(emblaNode, options);
  });
})();
