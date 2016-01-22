FilecolorView = require './filecolor-view'
{CompositeDisposable} = require 'atom'

module.exports = Filecolor =
  filecolorView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    atom.packages.activatePackage('tree-view').then ->
      @filecolorView = new FilecolorView(state.fileColorsViewState)

    # @filecolorView = new FilecolorView(state.filecolorViewState)
    # @modalPanel = atom.workspace.addModalPanel(item: @filecolorView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'filecolor:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @filecolorView.destroy()

  serialize: ->
    filecolorViewState: @filecolorView.serialize()

  toggle: ->
    console.log 'Filecolor was toggled!'

    # if @modalPanel.isVisible()
    #   @modalPanel.hide()
    # else
    #   @modalPanel.show()
