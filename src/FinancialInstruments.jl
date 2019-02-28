module FinancialInstruments

using Reexport, Dates
@reexport using Currencies
export FinancialInstrument, Cash

abstract type FinancialInstrument end

struct Cash{C<:Currency} <: FinancialInstrument end
Cash(c::C) where C<:Currency = Cash{C}()

for (sym,ccy) in Currencies.list
    @eval FinancialInstruments $sym = Cash($ccy)
end

end # module
