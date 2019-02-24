module FinancialInstruments

using Reexport, Dates
@reexport using Entities
export FinancialInstrument

struct FinancialInstrument{C<:Currency}
    name::String
    issuer::Entity{C}
    issued::DateTime
end

end # module
