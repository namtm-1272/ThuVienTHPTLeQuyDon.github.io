onRead = () => {
  document.querySelector(".book-content#content").style.display = "flex";
  document.querySelector(".book-information").style.maxWidth = "unset";
  document.querySelector(".book-information").style.width = "30%";
};

toggleCheckbox = (source, target) => {
  checkboxes = document.getElementsByClassName(`${target}-checkbox-item`);
  for (let i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = source.checked;
  }
};
