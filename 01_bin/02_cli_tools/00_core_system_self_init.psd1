@{
    RootPath = 'd:\CoreSystem'
    Directories = @(
        '01_bin'
        '01_bin\01_sys_control'
        '01_bin\02_cli_tools'
        '01_bin\03_hooks'
        '02_local_ai'
        '02_local_ai\01_models'
        '02_local_ai\02_runtimes'
        '02_local_ai\03_scripts'
        '03_gateway_ai'
        '03_gateway_ai\01_proxies'
        '03_gateway_ai\02_configs'
        '03_gateway_ai\03_clients'
        '04_persona_godview'
        '04_persona_godview\01_core_identify'
        '04_persona_godview\02_personas'
        '04_persona_godview\02_personas\01_developer'
        '04_persona_godview\02_personas\02_life_manager'
        '04_persona_godview\02_personas\03_strategist'
        '04_persona_godview\03_shared_memory'
        '05_media_vault'
        '05_media_vault\01_raw_media'
        '05_media_vault\02_processed'
        '05_media_vault\03_shared_links'
        '06_ai_training_lab'
        '06_ai_training_lab\01_sources'
        '06_ai_training_lab\02_pipelines'
        '06_ai_training_lab\03_datasets'
        '06_ai_training_lab\04_training_jobs'
    )
    Extensions = @{
        ExecutionPolicyBypass = $true
    }
}
