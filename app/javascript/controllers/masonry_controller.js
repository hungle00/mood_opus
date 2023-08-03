import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mansory"
export default class extends Controller {
  connect() {
    this.waitForImages();
  }

  /**
   * Apply spanning to all the masonry items
   *
   * Loop through all the items and apply the spanning to them using 
   * `resizeMasonryItem()` function.
   *
   * @uses resizeMasonryItem
  */
  resizeAllItems() {
    // Get all item class objects in one list
    var allItems = document.getElementsByClassName('card');
    // Loop through the above list and execute the spanning function to each masonry item
    for(var i=0;i<allItems.length;i++){
      this.resizeMasonryItem(allItems[i]);
    }
  };

  /* Do a resize once more when all the images finish loading */
  waitForImages() {
    var allItems = document.getElementsByClassName('card');
    for(var i=0;i<allItems.length;i++){
      imagesLoaded( allItems[i], (instance) => {
        var item = instance.elements[0];
        this.resizeMasonryItem(item);
      });
    }
  }

  /**
   * Set appropriate spanning to any masonry item
   */
  resizeMasonryItem = (item) => {
    /* Get the grid object, its row-gap, and the size of its implicit rows */
    var grid = document.getElementsByClassName('board-grid')[0],
        rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap')),
        rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows'));
    var rowSpan = Math.ceil((item.querySelector('.content').getBoundingClientRect().height)/(rowHeight+rowGap));

    /* Set the spanning as calculated above (S) */
    item.style.gridRowEnd = 'span '+rowSpan;
  }
}

