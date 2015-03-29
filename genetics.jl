# genetics.jl

# This script defines the "alogirthm" used to solve the problem in the form of genes

# Genes are defined in a tree structure, referencing their parents.


###### Example Input ######

# Create All Genes
# Define all Proteins Generated by Genes
# Proteins are all functions
# Note: protein lifetime length is stored in the gene for that protein

println("Genetics Importing Begun")

include("output.jl")

function root_protein(molecule) 
	#println("Never used this function, baka")
	output = 0
	backreg = 0
	return ([molecule], backreg, output)
end

root = Gene(nothing, root_protein, 1.0,  0.0)

function dmg_protein(molecule)
	#println("Running destroyMolecule")
	#outputCount = outputCount + 1
	output = 1
	backreg = 0
	return ([], backreg, output)
end

destroyMoleculeGene = Gene(root, dmg_protein, 0.5, 5.0)

function duplicate_protein(molecule)
	output = 0
	backreg = 0
	return ([molecule, molecule], backreg, output)
end

dupMolGene = Gene(root, duplicate_protein, 0.5, 5.0)


# Finally set list of genes/proteins and their initial abundances
pa1 = ProteinAbundance(root, 10)
pa2 = ProteinAbundance(destroyMoleculeGene, 20)
pa3 = ProteinAbundance(dupMolGene, 70)
proteinDistribution = [pa1, pa2, pa3]


println("Genetics Importing Finished")