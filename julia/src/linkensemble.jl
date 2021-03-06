
function linkensemble( models :: Vector{Model} ; by= x -> x.gscore, rev=false )
  
  nlinks = models[1].nlinks

  nsatisfied = [ 0 for i in 1:length(models) ]
  satisfied = [ false for i in 1:nlinks ]

  # The models have to be sorted by the desired score
  sort!( models, by = by, rev = rev )

  for imodel in 1:length(models)
    for ilink in 1:nlinks
      if models[imodel].link[ilink].result == "OK: FOUND"
        satisfied[ilink] = true
      end
    end
    nsatisfied[imodel] = count(satisfied)
  end

  return nsatisfied

end
