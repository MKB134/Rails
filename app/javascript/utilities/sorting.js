class Sorting {
  constructor(control){
    this.control = control
    this.setup()
  }

  setup(){
    this.control.addEventListener('click', this.sortRowsByTitle)
  }

  sortRowsByTitle() {
    const table = this.offsetParent
    const arrowUp = this.querySelector('.octicon-arrow-up')
    const arrowDown = this.querySelector('.octicon-arrow-down')
    const sortedRows = Array.from(table.rows).slice(1)

    if (arrowUp.classList.contains('hide')) {
      sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1)
      arrowUp.classList.remove('hide')
      arrowDown.classList.add('hide')
    }
    else {
      sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1)
      arrowUp.classList.add('hide')
      arrowDown.classList.remove('hide')
    }

    table.tBodies[0].append(...sortedRows)
  }
}

document.addEventListener('turbolinks:load', function () {
  const control = document.querySelector('.sort-by-title')

  if (control) new Sorting(control)
})
