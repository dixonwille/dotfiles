[[ "${DFLOADED[AZURE]}" == "1" ]] && return
DFLOADED[AZURE]="1"

load_module "microsoft"

df_package "azure-cli"

if [[ "${DFCONF[IS_WORK]}" == "1" ]]; then
  df_after_install "az extension add --allow-preview false --name 'azure-devops'"
  df_after_install "az bicep install"
  df_symlink "$HOME/.local/bin/bicep" "$XDG_DATA_HOME/azure/bin/bicep"
fi
