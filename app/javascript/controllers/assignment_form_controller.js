import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["emailInput", "datalist"];

  connect() {
    this.emailInputTarget.addEventListener("input", this.fetchUserSuggestions.bind(this));
  }

  fetchUserSuggestions() {
    const searchTerm = this.emailInputTarget.value;

    fetch(`/users/search?email=${searchTerm}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json"
        },
      })
      .then((response) => response.json())
      .then((data) => {
        this.populateDatalist(data);
      })
      .catch((error) => {
        console.error("Error fetching user suggestions:", error);
      });
  }

  populateDatalist(data) {
    this.datalistTarget.innerHTML = "";

    data.forEach((user) => {
      const option = document.createElement("option");
      option.value = user.email;
      this.datalistTarget.appendChild(option);
    });
  }
}
