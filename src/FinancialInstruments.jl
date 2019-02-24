module FinancialInstruments

using Reexport, Dates
@reexport using Entities
export FinancialInstrument

struct FinancialInstrument
    name::String
    currency::Currency
    issuer::Entity
    issued::DateTime
end

end # module
