# frozen_string_literal: true
require 'byebug'

class InvalidCodonError < StandardError; end

class Translation
  PROTEIN = { 'Methionine' => ['AUG'],
              'Phenylalanine' => ['UUU', 'UUC'],
              'Leucine' => ['UUA', 'UUG'],
              'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
              'Tyrosine' => ['UAU', 'UAC'],
              'Cysteine' => ['UGU', 'UGC'],
              'Tryptophan' => ['UGG'],
              'STOP' => ['UAA', 'UAG', 'UGA'] }.freeze

  CODE_SIZE = 3

  def self.of_codon(codon)
    PROTEIN.each do |key, values|
      return key if values.include? codon
    end
    nil
  end

  def self.of_rna(strand)
    sequence = strand.split('')
    codes = []
    until sequence.size.zero?
      code = sequence.shift(CODE_SIZE).join
      raise InvalidCodonError unless of_codon(code)
      break if PROTEIN['STOP'].include? code
      codes << of_codon(code)
    end
    codes
  end
end
