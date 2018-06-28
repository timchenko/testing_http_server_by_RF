*** Settings ***
Library     RequestsLibrary
Library     Process
Suite Teardown   Run Keywords   Delete All Sessions   AND   Terminate ALL Processes   kill=True


*** Variables ***
${cor_len_cor_sym_header_name}=      QWErty123456
${one_cor_sym_header_name}=          F
${incor_len_cor_sym_header_name}=    QWErty1234567
${cor_len_incor_sym_header_name}=    QWE_rty-123

${ADDRESS}    127.0.0.1
${PORT}       8080

*** Test Cases ***
Initialize
    Start Process       python              main.py         ${PORT}
    Create Session      localhost           http://${ADDRESS}:${PORT}

Positive Tests
    ${header}=      Create Dictionary       ${cor_len_cor_sym_header_name}=Value
    ${resp}=        Get Request             localhost   /       headers=${header}   timeout=10
    Should Be Equal As Strings              ${resp.status_code}     200

    ${header}=      Create Dictionary       ${one_cor_sym_header_name}=Value
    ${resp}=        Get Request             localhost   /       headers=${header}   timeout=10
    Should Be Equal As Strings              ${resp.status_code}     200

Wrong length
    ${header}=      Create Dictionary       ${incor_len_cor_sym_header_name}=Value
    ${resp}=        Get Request             localhost   /       headers=${header}   timeout=10
    Should Be Equal As Strings              ${resp.status_code}     500

Wrong symbol
    ${header}=      Create Dictionary       ${cor_len_incor_sym_header_name}=Value
    ${resp}=        Get Request             localhost   /       headers=${header}   timeout=10
    Should Be Equal As Strings              ${resp.status_code}     500

