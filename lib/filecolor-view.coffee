module.exports =
class FilecolorView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('filecolor')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Filecolor package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

    # apply colors
    this.applyColors()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  removeColors: ->
    # remove file colors from tree view
    treeViewEl = document.querySelectorAll('.tree-view')[0];
    treeViewEl.classList.remove('file-colors')

    # remove file colors from tab bar
    tabBar = document.querySelectorAll('.list-inline.tab-bar')[0];
    tabBar.classList.remove('file-colors')

    # show message
    displayText = "Colors removed from files"
    @element.children[0].textContent = displayText

  applyColors: ->
    # apply file colors to tree view
    treeViewEl = document.querySelectorAll('.tree-view')[0];
    treeViewEl.classList.add('file-colors')

    # apply file colors to tab bar
    tabBar = document.querySelectorAll('.list-inline.tab-bar')[0];
    tabBar.classList.add('file-colors')

    # show message
    displayText = "Colors applied to files"
    @element.children[0].textContent = displayText
