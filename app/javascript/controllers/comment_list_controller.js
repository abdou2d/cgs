import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["text", "img", "comment",  "commentList", "count", "commentErrors"]

  onPostSuccess(event) {
    let [data, status, xhr] = event.detail;
    this.commentListTarget.innerHTML += xhr.response;
    this.textTarget.value = "";
    this.imgTarget.value = "";
    this.countTarget.innerHTML ++;
    this.commentErrorsTarget.innerText = "";
  }

  destroy(event) {
    this.commentTarget.remove(); 
  }

  setCommentCount(){
    this.commentCountTarget.innerHTML = safetext(commentCountStr);
  }

  onPostError(event) {
    let [data,  status, xhr] = event.detail;
    this.commentErrorsTarget.innerHTML = xhr.response;
  }
}