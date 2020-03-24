module FinancialInstruments

using Dates
using Countries 

export Currencies, Currency
export Countries, Country
export FinancialInstrument, Cash

abstract type FinancialInstrument end

struct Cash{C<:Currency} <: FinancialInstrument
    function Cash{T}() where T
        c = new()
        list[Currencies.symbol(T)] = c
        return c
    end
end
Cash(c::C) where C<:Currency = Cash{C}()
const list = Dict{Symbol,FinancialInstrument}()

for (sym,ccy) in Currencies.list
    @eval FinancialInstruments begin
        $sym = Cash($ccy)
    end
end

end # module
