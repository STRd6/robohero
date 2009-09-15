# Autogenerated from a Treetop grammar. Edits may be lost.


module RoboHero
  include Treetop::Runtime

  def root
    @root || :activated_ability
  end

  module ActivatedAbility0
    def costs
      elements[0]
    end

    def effect
      elements[2]
    end
  end

  module ActivatedAbility1
    def cost_array
      costs.cost_array
    end
  end

  def _nt_activated_ability
    start_index = index
    if node_cache[:activated_ability].has_key?(index)
      cached = node_cache[:activated_ability][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_costs
    s0 << r1
    if r1
      if has_terminal?(": ", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure(": ")
        r2 = nil
      end
      s0 << r2
      if r2
        r3 = _nt_effect
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ActivatedAbility0)
      r0.extend(ActivatedAbility1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:activated_ability][start_index] = r0

    r0
  end

  module Costs0
    def cost_array
      elements.map do |element|
        element.cost
      end
    end
  end

  def _nt_costs
    start_index = index
    if node_cache[:costs].has_key?(index)
      cached = node_cache[:costs][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_cost_element
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    r0.extend(Costs0)

    node_cache[:costs][start_index] = r0

    r0
  end

  module CostElement0
  end

  module CostElement1
    def cost
      elements[1].cost
    end
  end

  def _nt_cost_element
    start_index = index
    if node_cache[:cost_element].has_key?(index)
      cached = node_cache[:cost_element][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('(', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r1 = nil
    end
    s0 << r1
    if r1
      i2 = index
      r3 = _nt_energy_cost
      if r3
        r2 = r3
      else
        r4 = _nt_cooldown_cost
        if r4
          r2 = r4
        else
          @index = i2
          r2 = nil
        end
      end
      s0 << r2
      if r2
        if has_terminal?(')', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r5 = nil
        end
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CostElement0)
      r0.extend(CostElement1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:cost_element][start_index] = r0

    r0
  end

  module EnergyCost0
    def cost_amount
      elements[0]
    end

  end

  module EnergyCost1
    def cost
      [ 'energy', cost_amount.text_value.to_i ]
    end
  end

  def _nt_energy_cost
    start_index = index
    if node_cache[:energy_cost].has_key?(index)
      cached = node_cache[:energy_cost][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      i3 = index
      if has_terminal?('EN', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('EN')
        r4 = nil
      end
      if r4
        r3 = r4
      else
        if has_terminal?('E', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('E')
          r5 = nil
        end
        if r5
          r3 = r5
        else
          @index = i3
          r3 = nil
        end
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(EnergyCost0)
      r0.extend(EnergyCost1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:energy_cost][start_index] = r0

    r0
  end

  module CooldownCost0
    def cost_amount
      elements[0]
    end

  end

  module CooldownCost1
    def cost
      [ 'cooldown', cost_amount.text_value.to_i ]
    end
  end

  def _nt_cooldown_cost
    start_index = index
    if node_cache[:cooldown_cost].has_key?(index)
      cached = node_cache[:cooldown_cost][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      if has_terminal?('C', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('C')
        r3 = nil
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CooldownCost0)
      r0.extend(CooldownCost1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:cooldown_cost][start_index] = r0

    r0
  end

  def _nt_effect
    start_index = index
    if node_cache[:effect].has_key?(index)
      cached = node_cache[:effect][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if index < input_length
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("any character")
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:effect][start_index] = r0

    r0
  end

end

class RoboHeroParser < Treetop::Runtime::CompiledParser
  include RoboHero
end

