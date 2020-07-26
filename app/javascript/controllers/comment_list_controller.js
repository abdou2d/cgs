import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["text", "commentList", "commentErrors"]

  onPostSuccess(event) {
    let [data, status, xhr] = event.detail;
    this.commentListTarget.innerHTML += xhr.response;
    this.textTarget.value = "";
    this.commentErrorsTarget.innerText = "";
  }

  onPostError(event) {
    let [data,  status, xhr] = event.detail;
    this.commentErrorsTarget.innerHTML = xhr.response;
  }
}