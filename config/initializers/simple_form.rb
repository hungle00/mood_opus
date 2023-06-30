# frozen_string_literal: true
#
# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components to know
# more about custom components.
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }
#
SimpleForm.setup do |config|
  # Define the way to render check boxes / radio buttons with labels.
  # Defaults to :nested for bootstrap config.
  #   inline: input + label
  #   nested: label > input
  config.boolean_style = :inline

  # Default class for buttons
  config.button_class = 'px-4 py-2 text-sm font-medium rounded-md bg-red-500 text-white cursor-pointer focus:shadow-outline hover:bg-red-600'

  # Series of attempts to detect a default label method for collection.
  # config.collection_label_methods = [ :to_label, :name, :title, :to_s ]

  # Series of attempts to detect a default value method for collection.
  # config.collection_value_methods = [ :id, :to_s ]

  # You can wrap a collection of radio/check boxes in a pre-defined tag, defaulting to none.
  # config.collection_wrapper_tag = nil

  # You can define the class to use on all collection wrappers. Defaulting to none.
  # config.collection_wrapper_class = nil

  # How the label text should be generated altogether with the required text.
  config.label_text = lambda { |label, required, explicit_label| "#{label} #{required}" }
  # You can define the class to use on all labels. Default is nil.
  # config.label_class = nil

  # You can define the default class to be used on forms. Can be overridden
  # with `html: { :class }`. Defaulting to none.
  # config.default_form_class = nil

  # You can define which elements should obtain additional classes
  # config.generate_additional_classes_for = [:wrapper, :label, :input]

  # Whether attributes are required by default (or not). Default is true.
  # config.required_by_default = true

  # CSS class to add for error notification helper.
  config.error_notification_class = 'text-red-500 mb-3'
  # Default tag used for error notification helper.
  config.error_notification_tag = :div

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = 'border-red-500'
  config.input_field_valid_class = 'border-green-400'
  config.label_class = 'text-sm font-medium text-gray-600'


  # vertical default_wrapper
  config.wrappers :vertical_input, tag: 'div', class: 'mb-3' do |b|

    # Determines whether to use HTML5 (:email, :url, ...)
    # and required attributes
    b.use :html5
    b.use :placeholder

    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    ## Inputs
    # b.use :input, class: 'input', error_class: 'is-invalid', valid_class: 'is-valid'
    # b.use :error, wrap_with: { tag: :span, class: :error }

    b.use :label, class: "block text-gray-700 mb-2"
    b.use :input, class: "block my-1 w-full rounded shadow appearance-none border border-gray-500"
    b.use :hint,  wrap_with: { tag: :p, class: "text-indigo-700 text-xs italic" }

    ## full_messages_for
    # If you want to display the full error message for the attribute, you can
    # use the component :full_error, like:
    b.use :full_error, wrap_with: { tag: :span, class: "text-red-500 text-xs italic" }
  end

  config.wrappers :f_boolean, tag: 'div', class: 'my-2', error_class: '' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'label', class: 'inline-flex items-center' do |bb|
      bb.use :input, class: 'border-gray-700 rounded mr-2', error_class: ''
      bb.use :label_text, class: 'ml-2'
    end
    b.use :hint,  wrap_with: { tag: :span, class: "block text-indigo-700 text-xs italic" }
    b.use :full_error, wrap_with: { tag: :span, class: "block text-red-500 text-xs italic" }
  end

  config.wrappers :f_collection, item_wrapper_class: 'flex items-center', item_label_class: 'my-1 ml-3 block' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :label_tag, class: 'text-gray-700 my-2', error_class: '' do |bb|
      bb.use :label_text
      bb.use :input, class: 'text-indigo-600 border-gray-700 rounded', error_class: ''
    end
    b.use :hint,  wrap_with: { tag: :span, class: "block text-indigo-700 text-xs italic" }
    b.use :full_error, wrap_with: { tag: :span, class: "block text-red-500 text-xs italic" }
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_input

  # Custom mappings for input types. This should be a hash containing a regexp to match as key.
  # config.input_mappings = { /count/ => :integer }

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = 
    { 
      boolean:        :f_boolean,
      radio_buttons:  :f_collection,
      check_boxes:    :f_collection 
    }

  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = 'checkbox'

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  # config.include_default_input_wrapper_class = true

  # Defines which i18n scope will be used in Simple Form.
  # config.i18n_scope = 'simple_form'

  # Defines validation classes to the input_field. By default it's nil.
  # config.input_field_valid_class = 'is-valid'
  # config.input_field_error_class = 'is-invalid'
end
