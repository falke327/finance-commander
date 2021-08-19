package de.falke.financecommander.bank;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class BankService {

    private final BankRepository bankRepository;

    public List<Bank> getAllBanks() {
        return this.bankRepository.findAll();
    }

    public void addBank(Bank bank) {
        // check if bank is already existing
        this.bankRepository.save(bank);
    }
}
