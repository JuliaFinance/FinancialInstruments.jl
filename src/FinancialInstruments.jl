module FinancialInstruments

using Dates
using Currencies
export FinancialInstrument, Cash, Currencies

abstract type FinancialInstrument end

struct Cash{C<:Currency} <: FinancialInstrument end
Cash(c::C) where C<:Currency = Cash{C}()

for (sym,ccy) in Currencies.list
    @eval FinancialInstruments $sym = Cash($ccy)
end

end # module
