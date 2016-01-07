require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/asakai"

Lita::Handlers::Asakai.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
